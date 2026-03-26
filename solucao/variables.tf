variable "aws_region" {
  description = "Região da AWS onde a instância será criada"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "ID da AMI Amazon Linux 2"
  type        = string
}