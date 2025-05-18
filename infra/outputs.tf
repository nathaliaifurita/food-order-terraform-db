output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "sg_id" {
  value = module.vpc.security_group_id
}

output "rds_endpoint" {
  value       = var.create_rds ? aws_db_instance.rds_instance[0].endpoint : null
  description = "Endpoint do RDS (se criado)"
}

output "rds_port" {
  value       = var.create_rds ? aws_db_instance.rds_instance[0].port : null
  description = "Porta do RDS (se criado)"
}

output "rds_db_name" {
  value       = var.create_rds ? aws_db_instance.rds_instance[0].identifier : null
  description = "Identificador da instância RDS"
}
