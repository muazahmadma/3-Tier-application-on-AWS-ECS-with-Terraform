variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "frontend_port" {
  description = "Port for the frontend service"
  type        = number
}

variable "backend_port" {
  description = "Port for the backend service"
  type        = number
}

variable "public_subnet" {
  description = "IDs of the public subnets"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs of the public subnets"
  type        = list(string)
}


variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  type        = string
}

variable "Frontend_security_group_id" {
  description = "ID of the ECS security group"
  type        = string
}

variable "Backend_security_group_id" {
  description = "ID of the ECS security group"
  type        = string
}

variable "db_host" {
  description = "RDS host endpoint"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "backend_ecr_image_url" {
  description = "URL of the ECR image to use for the ECS task"
  type        = string
}

variable "frontend_ecr_image_url" {
  description = "URL of the ECR image to use for the ECS task"
  type        = string
}


variable "aws_region" {
  description = "The AWS region"
  type        = string
}

variable "alb_target_group_frontend_arn" {
   type = string
}