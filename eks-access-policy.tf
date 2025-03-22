resource "aws_eks_access_policy_association" "eks-access-policy" {
  cluster_name  = aws_db_instance.rds_postgres.identifier
  policy_arn    = var.policyArn
  principal_arn = var.principalArn

  access_scope {
    type = "cluster"
  }
}

