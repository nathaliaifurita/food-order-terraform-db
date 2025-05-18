// Declaração da variável create_vpc
variable "create_vpc" {
  description = "Define se a VPC deve ser criada ou reutilizada"
  type        = bool
  default     = false
}

// Busca VPC existente
data "aws_vpc" "existing_vpc" {
  count = var.create_vpc ? 0 : 1

  filter {
    name   = "cidr-block"
    values = ["172.31.0.0/16"]
  }
}

// Cria VPC se necessário
resource "aws_vpc" "main_vpc" {
  count = var.create_vpc ? 1 : 0

  cidr_block = "172.31.0.0/16"

  tags = {
    Name        = "Main VPC"
    Environment = "production"
  }
}

locals {
  vpc_id = var.create_vpc ? aws_vpc.main_vpc[0].id : (
    length(data.aws_vpc.existing_vpc) > 0 ? data.aws_vpc.existing_vpc[0].id : null
  )
}

// Busca subnets públicas existentes
data "aws_subnet" "existing_public_subnets" {
  count = var.create_vpc ? 0 : 2

  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }

  filter {
    name   = "availability-zone"
    values = [element(["us-east-1a", "us-east-1b"], count.index)]
  }
}

// Cria subnets públicas se necessário
resource "aws_subnet" "public_subnets" {
  count                   = var.create_vpc ? 2 : 0
  vpc_id                  = local.vpc_id
  cidr_block              = cidrsubnet("172.31.0.0/16", 4, count.index + 2)
  availability_zone       = element(["us-east-1a", "us-east-1b"], count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "Public Subnet ${count.index + 1}"
    Environment = "public"
//    "kubernetes.io/cluster/${var.projectName}" = "shared"
//    "kubernetes.io/role/elb"                   = "1"
  }
}

// Busca subnets privadas existentes
data "aws_subnet" "existing_private_subnets" {
  count = var.create_vpc ? 0 : 2

  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }

  filter {
    name   = "availability-zone"
    values = [element(["us-east-1a", "us-east-1b"], count.index)]
  }
}

// Cria subnets privadas se necessário
resource "aws_subnet" "private_subnets" {
  count             = var.create_vpc ? 2 : 0
  vpc_id            = local.vpc_id
  cidr_block        = cidrsubnet("172.31.0.0/16", 4, count.index)
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)

  tags = {
    Name        = "Private Subnet ${count.index + 1}"
    Environment = "private"
    "kubernetes.io/cluster/${var.projectName}" = "shared"
    "kubernetes.io/role/internal-elb"         = "1"
  }
}

locals {
  private_subnet_ids = var.create_vpc ? aws_subnet.private_subnets[*].id : (length(data.aws_subnet.existing_private_subnets) > 0 ? data.aws_subnet.existing_private_subnets[*].id : [])
  public_subnet_ids  = var.create_vpc ? aws_subnet.public_subnets[*].id : (length(data.aws_subnet.existing_public_subnets) > 0 ? data.aws_subnet.existing_public_subnets[*].id : [])
}

// Grupo de subnets para o RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = local.private_subnet_ids

  tags = {
    Name        = "RDS Subnet Group"
    Environment = "production"
  }
}


