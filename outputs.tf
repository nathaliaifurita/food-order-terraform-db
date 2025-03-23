output "rds_endpoint" {
  value = aws_db_instance.rds_postgres.endpoint
}

output "rds_port" {
  value = aws_db_instance.rds_postgres.port
}

output "database_name" {
  value = aws_db_instance.rds_postgres.db_name
}