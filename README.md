# Projeto de Infraestrutura Kubernetes e Banco de Dados Gerenciáveis com Terraform

## 📌 Visão Geral

Este repositório contém a configuração de infraestrutura para Kubernetes e banco de dados gerenciáveis utilizando Terraform. O projeto segue as melhores práticas de CI/CD, garantindo automação e segurança no deploy dos recursos.

## 🏗️ Arquitetura

A infraestrutura é composta por:
- Cluster Kubernetes (EKS): Provisionado via Terraform para orquestração de contêineres.
- Banco de Dados Gerenciado (RDS): Configurado como código para persistência de dados.
- API Gateway + AWS Lambda: Implementação de autenticação de clientes via CPF.
- Deploy Automatizado: Utilizando GitHub Actions com proteção de branches.


## 🚀 Tecnologias Utilizadas

- Terraform: Para provisionamento da infraestrutura.
- Kubernetes: Para orquestração de contêineres.
- GitHub Actions: Para CI/CD automatizado.
- AWS Lambda (Elixir): Para autenticação via CPF.
- API Gateway: Para intermediar requisições entre clientes e backend.
- PostgreSQL: Banco de dados relacional gerenciado na AWS (RDS).

## 📁 Estrutura do Repositório
```
food-order-terraform-db
├── .github/workflows/  # Configuração dos pipelines de CI/CD
│   ├── terraform.yml  # Workflow para provisionamento da infraestrutura AWS com Terraform
├── k8s/
│   ├── postgres-deployment.yaml  # Definição do deployment do PostgreSQL no Kubernetes
│   ├── postgres-service.yaml  # Serviço para expor o banco de dados PostgreSQL
├── data.tf  # Definições de dados e recursos compartilhados
├── eks-access-entry.tf  # Configuração de regras de acesso ao EKS
├── eks-access-policy.tf  # Políticas de acesso e permissões para o EKS
├── eks-cluster.tf  # Configuração do cluster EKS na AWS
├── eks-rds.tf  # Configuração do banco de dados gerenciado (RDS)
├── outputs.tf  # Saídas do Terraform para referência
├── provider.tf  # Configuração do provider AWS no Terraform
├── sg.tf  # Regras de segurança do Security Group
├── vars.tf  # Definição de variáveis do Terraform
└── README.md  # Documentação do projeto
```

## 🔧 Configuração e Deploy
### 📌 Pré-requisitos
- Terraform instalado
- AWS CLI configurado
- kubectl instalado

## 🚀 Passos para Deploy

1. Clone o repositório: 
```git clone https://github.com/nathaliaifurita/food-order-terraform-db.git```
```cd food-order-terraform-db```

2. Inicialize o Terraform:
```terraform init```

3. Valide e aplique a infraestrutura:
```terraform plan```
```terraform apply```

4. Configure o contexto do Kubernetes:
```aws eks update-kubeconfig --name nome-do-cluster --region regiao```

5. Implante aplicações no cluster:
```kubectl apply -f k8s/```

## 🔑 Configuração do Secrets no GitHub

### 1️⃣ Acesse as configurações do repositório
1. Vá até o repositório no GitHub.
2. Clique em Settings.
3. No menu lateral, clique em Secrets and variables > Actions.
4. Clique em New repository secret.

#### 2️⃣ Adicione as Secrets necessárias
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

3. `labRole`: Esse valor é o ARN de uma função IAM usada para gerenciar os recursos de seu laboratório ou ambiente de testes. Certifique-se de substituir o valor pelo ARN correto da função que você deseja usar.

Com essas variáveis configuradas, o Terraform poderá utilizar os recursos da AWS de forma segura, garantindo que sua infraestrutura seja criada e configurada corretamente.

