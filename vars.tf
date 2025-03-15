variable "regionDefault" {
  default = "us-east-1"
}

variable "projectName" {
  default = "EKS-FOOD-ORDER-DB"
}

variable "labRole" {
  default = "arn:aws:iam::239569854352:role/LabRole"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "nodeGroup" {
  default = "food-order-db-node-group"
}

variable "instanceType" {
  default = "t3.medium"
}

variable "principalArn" {
  default = "arn:aws:iam::202378092067:role/voclabs"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}