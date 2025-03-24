output "rds_endpoint" {
  value = aws_db_instance.rds_postgres.endpoint
}

output "rds_port" {
  value = aws_db_instance.rds_postgres.port
}

output "database_name" {
  value = aws_db_instance.rds_postgres.db_name
}

output "vpc_id" {
  value = local.vpc_id
}

output "security_group_id" {
  value = aws_security_group.sg.id
}

output "aws_session_token" {
  value     = var.labRole.session_token
  sensitive = true
}
