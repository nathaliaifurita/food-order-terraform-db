terraform {
  cloud {
    organization = "sua-organizacao"

    workspaces {
      name = "food-order-db"
    }
  }
} 