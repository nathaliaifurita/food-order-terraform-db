resource "aws_db_instance" "rds_postgres" {
  identifier              = var.rdsName
  engine                  = "postgres"
  engine_version          = "15.7"
  instance_class          = var.instanceType
  allocated_storage       = 20
  max_allocated_storage   = 100
  storage_encrypted       = true
  multi_az                = true

  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password

  # Usa nome de grupo existente
  db_subnet_group_name    = "rds-subnet-group"

  # Usa security group existente via data source
  vpc_security_group_ids  = [aws_security_group.db_sg.id]

  publicly_accessible     = false
  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "Mon:04:00-Mon:05:00"
  monitoring_interval     = 0
  performance_insights_enabled = true
  deletion_protection     = false
  skip_final_snapshot     = true

  tags = {
    Name        = "PostgreSQL RDS"
    Environment = "production"
  }
}
