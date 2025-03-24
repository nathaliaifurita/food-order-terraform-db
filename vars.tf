variable "regionDefault" {
  default = "us-east-1"
}

variable "projectName" {
  default = "EKS-FOOD-ORDER-DB"
}

variable "rds_postgres"{
    default = "eks-rds-postgres"
}

variable "rdsName" {
  default = "food-order-db"
}

variable "eks_cluster"{
  default = "EKS-FOOD-ORDER-DB"
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

variable "AWS_SESSION_TOKEN" {
  description = "Token de sessão da AWS"
  type        = string
  default     = ""
}

variable "db_name" {
  description = "Nome do banco de dados"
  type        = string
  default     = "foodorderdb"
}

variable "db_username" {
  description = "Username do banco de dados"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  default     = "postgres"
  sensitive   = true
}