variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  default     = "flask-app"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "db_instance_class" {
  description = "RDS instance type"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Database name"
  default     = "flaskapp"
}

variable "db_username" {
  description = "Database username"
  default     = "flaskuser"
}

variable "frontend_port" {
  description = "Port for the frontend service"
  default     = 5002
}

variable "backend_port" {
  description = "Port for the backend service"
  default     = 5001
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "flask-app-ecs-task-execution-role"
}

variable "backend_ecr_image_url" {
  description = "URL of the ECR image to use for the ECS task"
  type        = string
}

variable "frontend_ecr_image_url" {
  description = "URL of the ECR image to use for the ECS task"
  type        = string
}

variable "account_id" {
  description = "The AWS account ID"
  type        = string
}