output "db_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.main.endpoint
}

output "db_password" {
  description = "Password for the RDS instance"
  value       = random_password.db_password.result
  sensitive   = true
}

output "db_secret_arn" {
  description = "ARN of the secret containing the DB credentials"
  value       = aws_secretsmanager_secret.db_password.arn
}