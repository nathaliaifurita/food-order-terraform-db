resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster
  role_arn = var.labRole

  vpc_config {
    subnet_ids         = aws_subnet.private_subnets[*].id
    security_group_ids = [aws_security_group.sg.id]
  }

  access_config {
    authentication_mode = var.accessConfig
  }
}