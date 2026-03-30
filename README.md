# Desafio DevOps #1 - Terraform EC2

Este projeto foi desenvolvido como solução para o desafio proposto no repositório original:

👉 https://github.com/bfeliano/desafio-devops-01-terraform-ec2-iniciante

---

## Objetivo

Provisionar uma infraestrutura na AWS utilizando Terraform, incluindo:

* VPC customizada
* Subnet pública
* Internet Gateway
* Route Table
* Security Group (HTTP + SSH)
* EC2 com Apache configurado automaticamente via `user_data`

---

## Tecnologias utilizadas

* Terraform
* AWS EC2
* AWS VPC
* Bash (user_data)

---

## Como executar o projeto

```bash
terraform init
terraform plan
terraform apply / terraform apply -auto-approve
```

---

## Resultado esperado

Após o deploy, acesse o IP público exibido:

```bash
public_ip = "SEU_IP_AQUI"
```

E você verá:

![Resultado](assets/20.png)

---

## Passos

1. Configuração do Terraform

![Passo_01](assets/01.png)

2. Criação da VPC

![Passo_02](assets/02.png)
![Passo_03](assets/03.png)
![Passo_04](assets/04.png)
![Passo_05](assets/05.png)

3. Criação da subnet e internet gateway

![Passo_06](assets/06.png)
![Passo_07](assets/07.png)
![Passo_08](assets/08.png)

4. Criação da route table

![Passo_09](assets/09.png)
![Passo_10](assets/10.png)
![Passo_11](assets/11.png)
![Passo_12](assets/12.png)

5. Configuração do security group

![Passo_13](assets/13.png)
![Passo_14](assets/14.png)

6. Configuração AMI e instância EC2

![Passo_15](assets/15.png)
![Passo_16](assets/16.png)
![Passo_17](assets/17.png)
![Passo_18](assets/18.png)
![Passo_19](assets/19.png)

---

## 💡 Aprendizados

* Infraestrutura como Código (IaC)
* Configuração de rede na AWS
* Automação com Terraform
* Uso de `user_data` para provisionamento automático
* Boas práticas no Terraform e na conta free tier da AWS

---

## Referência

https://registry.terraform.io/providers/hashicorp/aws/latest/docs

## Licença

Este projeto está sob a licença MIT. Consulte o arquivo `LICENSE` para mais detalhes.