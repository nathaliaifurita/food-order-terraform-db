resource "aws_iam_policy" "rds_policy" {
  name        = "EKS-RDS-Access-Policy"
  description = "Permite que o EKS acesse o RDS"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "rds:DescribeDBInstances",
          "rds:ListTagsForResource",
          "rds:DescribeDBClusters",
          "rds:Connect",
          "rds:ExecuteStatement",
          "rds:BatchExecuteStatement"
        ]
        Resource = var.rds_arn
      }
    ]
  })
}