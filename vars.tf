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
  default = "arn:aws:iam::198212171636:role/LabRole"
}

variable "instanceType" {
  default = "db.t3.medium"
}

variable "principalArn" {
  default = "arn:aws:iam::198212171636:role/voclabs"
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

variable "create_vpc" {
  description = "Whether to create a new VPC or use an existing one"
  type        = bool
  default     = false  // Por padrão, tenta usar uma VPC existente
}

variable "db_username" {
  description = "Username for the RDS PostgreSQL instance"
  type        = string
  default     = "postgres"  // você pode mudar isso
}

variable "db_password" {
  description = "Password for the RDS PostgreSQL instance"
  type        = string
  sensitive   = true  // isso marca a variável como sensível
  default     = "postgres"
}

variable "db_name" {
  description = "Name of the database to create"
  type        = string
  default     = "foodorderdb"
}
