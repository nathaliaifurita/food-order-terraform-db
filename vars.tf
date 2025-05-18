variable "regionDefault" {
  default = "us-east-1"
}

variable "projectName" {
  default = "RDS-FOOD-ORDER-DB"
}

variable "rds_postgres"{
    default = "rds-postgres"
}

variable "rdsName" {
  default = "food-order-db"
}

variable "labRole" {
  default = "arn:aws:iam::916083420257:role/LabRole"
}

variable "instanceType" {
  default = "db.t3.medium"
}

variable "principalArn" {
  default = "arn:aws:iam::916083420257:role/voclabs"
}

variable "rds_arn" {
  default = "arn:aws:rds:us-east-1:916083420257::db:rdsName"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
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
