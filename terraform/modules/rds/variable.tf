variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of the private subnets"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "db_security_group_id" {
  description = "ID of the RDS security group"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance type"
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

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}