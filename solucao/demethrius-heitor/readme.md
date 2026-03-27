# 🚀 Desafio DevOps #1 - Terraform EC2

Este projeto foi desenvolvido como solução para o desafio proposto no repositório original:

👉 https://github.com/bfeliano/desafio-devops-01-terraform-ec2-iniciante

---

## 📌 Objetivo

Provisionar uma infraestrutura na AWS utilizando Terraform, incluindo:

* VPC customizada
* Subnet pública
* Internet Gateway
* Route Table
* Security Group (HTTP + SSH)
* EC2 com Apache configurado automaticamente via `user_data`

---

## 🛠️ Tecnologias utilizadas

* Terraform
* AWS EC2
* AWS VPC
* Bash (user_data)

---

## ⚙️ Como executar o projeto

```bash
terraform init
terraform plan
terraform apply
```

---

## 🌐 Resultado

Após o deploy, acesse o IP público exibido:

```bash
public_ip = "SEU_IP_AQUI"
```

E você verá:

```
Desafio DevOps #1 — Deploy realizado com sucesso!
```

---

## 📷 Evidência

(Coloque aqui um print do navegador com o site funcionando)

---

## 💡 Aprendizados

* Infraestrutura como Código (IaC)
* Configuração de rede na AWS
* Automação com Terraform
* Uso de `user_data` para provisionamento automático

---
