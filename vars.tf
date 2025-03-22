variable "regionDefault" {
  default = "us-east-1"
}

variable "rds_postgres"{
    default = "EKS-RDS-POSTGRES"
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