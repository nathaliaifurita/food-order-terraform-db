variable "regionDefault" {
  default = "us-east-1"
}

variable "eks-cluster"{
    default = "EKS-FOOD-ORDER-CLUSTER"
}

variable "rdsName" {
  default = "RDS-POSTGRES"
}

variable "instanceType" {
  default = "db.t3.medium"
}

variable "rds_arn" {
  default = "arn:aws:rds:us-east-1:198212171636::db:rdsName"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}