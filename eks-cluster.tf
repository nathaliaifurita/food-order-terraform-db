resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster
  role_arn = var.labRole

  vpc_config {
    subnet_ids = [
      aws_subnet.private_subnets[0].id,
      aws_subnet.private_subnets[1].id
    ]
  }
}