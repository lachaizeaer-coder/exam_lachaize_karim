# modules/rds/outputs.tf
output "db_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.rds.address
}

output "db_name" {
  description = "The database name"
  value       = aws_db_instance.rds.db_name
}

output "db_username" {
  description = "The database username"
  value       = aws_db_instance.rds.username
}

output "db_password" {
  description = "The database password"
  value       = aws_db_instance.rds.password
}