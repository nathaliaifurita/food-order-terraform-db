data "aws_vpc" "existing_vpc" {
  count = var.create_vpc ? 0 : 1  // Só busca se não formos criar uma nova

  filter {
    name   = "cidr-block"
    values = ["172.31.0.0/16"]
  }
  
  filter {
    name   = "tag:Name"
    values = ["Main VPC"]
  }
}

resource "aws_vpc" "main_vpc" {
  count = var.create_vpc ? 1 : 0  // Só cria se a variável for true

  cidr_block = "172.31.0.0/16"

  tags = {
    Name        = "Main VPC"
    Environment = "production"
  }
}

locals {
  vpc_id = var.create_vpc ? aws_vpc.main_vpc[0].id : data.aws_vpc.existing_vpc[0].id
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
}

resource "aws_subnet" "private_subnets" {
  count             = 2
  vpc_id            = local.vpc_id
  cidr_block        = var.create_vpc ? cidrsubnet(aws_vpc.main_vpc[0].cidr_block, 4, count.index) : cidrsubnet("172.31.0.0/16", 4, count.index)
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)

  tags = {
    Name        = "Private Subnet ${count.index + 1}"
    Environment = "private"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = aws_subnet.private_subnets[*].id

  tags = {
    Name        = "RDS Subnet Group"
    Environment = "production"
  }
}