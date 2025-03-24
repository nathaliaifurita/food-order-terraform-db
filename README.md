# food-order-terraform-db

1. Na página do AWS Academy, clicar em "Start Lab"
2. Acessar a página do Terraform Cloud
3. Altere as informações das variáveis no terraform, em Settings -> Variable sets -> AWS_CONFIG -> Edit variable set
4. Altere as variáveis abaixo:
    - aws_access_key_id
    - aws_secret_access_key
    - aws_session_token
5. Depois de salvar, vá na configuração do IAM na AWS e copie o código: `ARN:XYZ`
6. Colar o código ARN no arquivo: vars.rf
    - principalArn
    - labRole

# 🚀 Deploy de Infraestrutura AWS com Terraform e GitHub Actions

## 📌 Tecnologias
- Terraform
- AWS (EKS, RDS, IAM)
- GitHub Actions

## 📁 Estrutura
.github/workflows/ ├── terraform.yml # Infra AWS (Terraform) ├── deploy.yml # Deploy app (GitHub Actions) terraform/ ├── eks-rds.tf # Configuração principal ├── vars.tf # Variáveis ├── provider.tf # Provider AWS ├── outputs.tf # Saídas do Terraform