terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Automatically picks the latest version in the 5.x series
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block    = var.vpc_cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  project_name      = var.project_name
}

module "rds" {
  source = "./modules/rds"

  project_name      = var.project_name
  private_subnet_ids = module.vpc.private_subnet_ids
  db_subnet_group_name = "${var.project_name}-db-subnet-group"
  db_security_group_id = module.vpc.rds_security_group_id
  db_instance_class  = var.db_instance_class
  db_name           = var.db_name
  db_username       = var.db_username
  vpc_id            = module.vpc.vpc_id
}

module "alb" {
  source = "./modules/alb"

  project_name     = var.project_name
  vpc_id          = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet
  private_subnet_ids = module.vpc.private_subnet_ids
  alb_security_group_id = module.vpc.alb_security_group_id
}

module "ecs" {
  source = "./modules/ecs"

  project_name     = var.project_name
  vpc_id          = module.vpc.vpc_id
  frontend_port   = var.frontend_port
  backend_port    = var.backend_port

  public_subnet = module.vpc.public_subnet
  private_subnet_ids = module.vpc.private_subnet_ids

  ecs_task_execution_role_name = var.ecs_task_execution_role_name
  alb_target_group_frontend_arn = module.alb.frontend_target_group_arn

  Backend_security_group_id = module.vpc.Backend_security_group_id
  Frontend_security_group_id = module.vpc.Frontend_security_group_id

  frontend_ecr_image_url = var.frontend_ecr_image_url
  backend_ecr_image_url = var.backend_ecr_image_url

  aws_region = var.aws_region
  
  # RDS environment variables
  db_host     = replace(module.rds.db_endpoint, ":3306", "")
  db_name     = var.db_name
  db_username = var.db_username
  db_password = module.rds.db_password
}
