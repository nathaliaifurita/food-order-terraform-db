resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster
  role_arn = var.labRole

  vpc_config {
    subnet_ids = local.private_subnet_ids
  }

  access_config {
    authentication_mode = var.accessConfig
  }

  depends_on = [
    aws_db_instance.rds_postgres  # Garante que o RDS seja criado primeiro
  ]
}
