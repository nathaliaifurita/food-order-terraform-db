# Projeto de Infraestrutura Kubernetes e Banco de Dados Gerenciáveis com Terraform

## 📌 Visão Geral

Este repositório contém a configuração de infraestrutura para Kubernetes e banco de dados gerenciáveis utilizando Terraform. O projeto segue as melhores práticas de CI/CD, garantindo automação e segurança no deploy dos re

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
- PostgreSQL: Banco de dados relacional gerenciado na AWS (RDS)

## 📁 Estrutura
food-order-terraform-db
├── .github/workflows/  # Configuração dos pipelines de CI/CD
│   ├── terraform.yml  # Workflow para provisionamento da infraestrutura AWS com Terraform
│   ├── deploy-aws.yml  # Workflow para deploy da aplicação via GitHub Actions
├── k8s/
│   ├── postgres-deployment.yaml  # Definição do deployment do PostgreSQL no Kubernetes
│   ├── postgres-service.yaml  # Serviço para expor o banco de dados PostgreSQL
├── data.tf  # Definições de dados e recursos compartilhados
├── Dockerfile  # Definição da imagem Docker da aplicação
├── eks-access-entry.tf  # Configuração de regras de acesso ao EKS
├── eks-access-policy.tf  # Políticas de acesso e permissões para o EKS
├── eks-cluster.tf  # Configuração do cluster EKS na AWS
├── eks-rds.tf  # Configuração do banco de dados gerenciado (RDS)
├── outputs.tf  # Saídas do Terraform para referência
├── provider.tf  # Configuração do provider AWS no Terraform
├── sg.tf  # Regras de segurança do Security Group
├── vars.tf  # Definição de variáveis do Terraform
└── README.md  # Documentação do projeto

## 🔧 Configuração e Deploy
### 📌 Pré-requisitos
- Terraform instalado
- AWS CLI configurado
- kubectl instalado

## 🚀 Passos para Deploy

1. Clone o repositório: 
```git clone https://github.com/seu-usuario/food-order-terraform-db.git```
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