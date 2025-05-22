# :hamburger: Food Order - Terraform RDS Infrastructure
![FoodOrder](foodorder.png?raw=true "FoodOrder")

Este repositório contém a configuração de infraestrutura para Kubernetes e banco de dados gerenciáveis utilizando Terraform. O projeto segue as melhores práticas de CI/CD, garantindo automação e segurança no deploy dos recursos.

## 🏗️ Arquitetura

A infraestrutura é composta por:
- Cluster Kubernetes (EKS): Provisionado via Terraform para orquestração de contêineres.
- Banco de Dados Gerenciado (RDS): Configurado como código para persistência de dados.
- Deploy Automatizado: Utilizando GitHub Actions com proteção de branches.


## 🚀 Tecnologias Utilizadas

- Terraform: Para provisionamento da infraestrutura.
- Kubernetes: Para orquestração de contêineres.
- GitHub Actions: Para CI/CD automatizado.
- PostgreSQL: Banco de dados relacional gerenciado na AWS (RDS).

## 📁 Estrutura do Repositório
```
food-order-terraform-db
├── .github/workflows/  # Configuração dos pipelines de CI/CD
│   ├── deploy-aws.yaml  # Workflow para provisionamento da infraestrutura AWS com Terraform
├── infra/
|   ├── modules/vpc
|   |   ├── main.tf 
|   |   ├── outputs.tf # Saídas do VPC, SG e RDS para referência
|   |   ├── variables.tf # Definição de variáveis da VPC, SG e RDS
├── main.tf  # Configuração que define a criação ou não da VPC (caso já tenha sido criada, não cria novamente)
├── outputs.tf  # Saídas do Terraform para referência
├── provider.tf  # Configuração do provider AWS no Terraform
├── vars.tf  # Definição de variáveis do Terraform
└── README.md  # Documentação do projeto
```

## 🔑 Configuração do Secrets no GitHub

### 1️⃣ Acesse as configurações do repositório
1. Vá até o repositório no GitHub.
2. Clique em Settings.
3. No menu lateral, clique em Secrets and variables > Actions.
4. Clique em New repository secret.

### 2️⃣ Adicione as Secrets necessárias
✅ Para autenticação na AWS
Essas credenciais são usadas pelo Terraform e pelo GitHub Actions para acessar a AWS.

    | Nome da secret           | Descrição                                                                |
    | :------------------------| :------------------------------------------------------------------------|
    | `AWS_ACCESS_KEY_ID`      | Chave de acesso da AWS                                                   |
    | `AWS_SECRET_ACCESS_KEY`  | Chave secreta da AWS                                                     |
    | `AWS_SESSION_TOKEN`      | (Opcional) Token de sessão, se estiver usando credenciais temporárias    |

✅ Outras Secrets
Caso sua aplicação use um banco de dados ou outra API, adicione as credenciais necessárias.

    | Nome da secret           | Descrição                  |
    | :------------------------| :--------------------------|
    | `DB_NAME`                | Nome do Banco de Dados     |
    | `DB_USERNAME`            | Usuário do banco de dados  |
    | `DB_PASSWORD`            | Senha do banco de dados    |

✅ Configuração das variáveis no vars.tf
Você precisará ajustar as variáveis de configuração no arquivo `vars.tf`, incluindo o ARN do principal e o ARN do RDS. Essas variáveis são essenciais para autenticar e acessar os recursos da AWS.

Exemplo de variáveis:
````
variable "principalArn" {
  description = "ARN da função IAM principal para acessar recursos"
  default     = "arn:aws:iam::198212171636:role/voclabs"
}

variable "rds_arn" {
  description = "ARN do banco de dados RDS"
  default     = "arn:aws:rds:us-east-1:198212171636::db:rdsName"
}


variable "labRole" {
  description = "ARN do LabRole utilizado para gerenciamento de recursos"
  default     = "arn:aws:iam::198212171636:role/LabRole"
}
````

Passos:
1. `principalArn`: Esse valor corresponde ao ARN da função IAM que o Terraform usará para acessar os recursos. Certifique-se de substituir o valor pelo ARN correto de sua conta AWS.

2. `rds_arn`: Esse valor corresponde ao ARN do banco de dados RDS. Troque o valor rdsName pelo nome do seu banco de dados RDS.

Com essas variáveis configuradas, o Terraform poderá utilizar os recursos da AWS de forma segura, garantindo que sua infraestrutura seja criada e configurada corretamente.


### 🗄️ Outros repos do microserviço dessa arquitetura
- [Food Order Produção](https://github.com/diegogl12/food-order-producao)
- [Food Order Pagamento](https://github.com/diegogl12/food-order-pagamento)
- [Food Order Cardápio](https://github.com/RafaelKamada/foodorder-cardapio)
- [Food Order Pedidos](https://github.com/vilacalima/food-order-pedidos)
- [Food Order Usuários](https://github.com/RafaelKamada/FoodOrder)

### 🗄️ Outros repos do Terraform/DB dessa arquitetura
- [Food Order Terraform](https://github.com/RafaelKamada/food-order-terraform-infra)
- [Food Order DB](https://github.com/nathaliaifurita/food-order-terraform-db)
- [Food Order MongoDB](https://github.com/RafaelKamada/food-order-terraform-mongodb)

### :busts_in_silhouette: Autores
| [<img loading="lazy" src="https://avatars.githubusercontent.com/u/96452759?v=4" width=115><br><sub>Robson Vilaça - RM358345</sub>](https://github.com/vilacalima) |  [<img loading="lazy" src="https://avatars.githubusercontent.com/u/16946021?v=4" width=115><br><sub>Diego Gomes - RM358549</sub>](https://github.com/diegogl12) |  [<img loading="lazy" src="https://avatars.githubusercontent.com/u/8690168?v=4" width=115><br><sub>Nathalia Freire - RM359533</sub>](https://github.com/nathaliaifurita) |  [<img loading="lazy" src="https://avatars.githubusercontent.com/u/43392619?v=4" width=115><br><sub>Rafael Kamada - RM359345</sub>](https://github.com/RafaelKamada) |
| :---: | :---: | :---: | :---: |
