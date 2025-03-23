variable "regionDefault" {
  default = "us-east-1"
}

variable "rds_postgres"{
    default = "eks-rds-postgres"
}

variable "rdsName" {
  default = "food-order-db"
}

variable "eks_cluster"{
  default = "eks-food-order-db"
}

variable "labRole" {
  default = "arn:aws:iam::198212171636:role/LabRole"
}

variable "instanceType" {
  default = "db.t3.medium"
}

variable "principalArn" {
  default = "arn:aws:iam::198212171636:role/voclabs"
}

variable "rds_arn" {
  default = "arn:aws:rds:us-east-1:198212171636::db:rdsName"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "username"{
  default = "postgres"
}

variable "password"{
  default = "postgres"
}