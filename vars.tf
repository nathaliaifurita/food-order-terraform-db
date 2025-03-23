variable "regionDefault" {
  default = "us-east-1"
}

variable "rds_postgres"{
    default = "eks-rds-postgres"
}

variable "rdsName" {
  default = "food-order-db"
}

variable "projectName"{
  default = "eks-food-order-db"
}

variable "labRole" {
  default = "arn:aws:iam::340103052246:role/LabRole"
}

variable "instanceType" {
  default = "db.t3.medium"
}

variable "principalArn" {
  default = "arn:aws:iam::340103052246:role/voclabs"
}

variable "rds_arn" {
  default = "arn:aws:rds:us-east-1:340103052246::db:rdsName"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}