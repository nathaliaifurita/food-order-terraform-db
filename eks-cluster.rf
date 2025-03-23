resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private_subnets[0].id,
      aws_subnet.private_subnets[1].id
    ]
  }
}