module "vpc" {
  source                 = "./modules/vpc"
  create_vpc             = true
  create_subnets         = true
  create_security_group  = true
  create_rds             = true
  project_name           = "food-order"
  vpc_cidr_block         = "10.0.0.0/16"

  availability_zones = ["us-east-1a", "us-east-1b"]

  security_group_ingress = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  // Configurações do RDS
  rds_instance_class = "db.t3.micro"
  rds_engine         = "postgres"
  rds_engine_version = "15.3"
  rds_username       = "admin"
  rds_password       = "postgres"
  rds_allocated_storage = 20
  rds_skip_final_snapshot = true
  rds_deletion_protection = false // Para facilitar testes, defina como true em produção

  tags = {
    Environment = "production"
    Owner       = "devops"
    Project     = "food-order"
  }
}
