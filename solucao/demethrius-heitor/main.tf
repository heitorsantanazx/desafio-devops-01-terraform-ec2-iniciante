# Criando uma VPC
resource "aws_vpc" "mtc_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev_heitor_vpc"
  }
}

# Criando uma subnet pública
resource "aws_subnet" "mtp_public_subnet" {
  vpc_id                  = aws_vpc.mtc_vpc.id
  cidr_block              = "10.123.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev_public"
  }
}

# Criando um internet gateway
resource "aws_internet_gateway" "mtc_igw" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "dev_igw"
  }
}

# Criando uma route table
resource "aws_route_table" "mtc_public_rt" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "dev_public_rt"
  }
}

resource "aws_route" "mtc_default_route" {
  route_table_id         = aws_route_table.mtc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mtc_igw.id
}

# Associando a route table à uma subnet pública

resource "aws_route_table_association" "mtc_public_assoc" {
  subnet_id      = aws_subnet.mtp_public_subnet.id
  route_table_id = aws_route_table.mtc_public_rt.id
}

# Criando um security group

variable "trusted_ip_cidr" {
  description = "O bloco CIDR do endereço IP confiável"
  type        = string
  sensitive   = true # Marca a variável como sensível para restringir a saída no console
}

resource "aws_security_group" "mtc_sg" {
  name        = "dev_sg_heitor"
  description = "Security group para o ambiente de desenvolvimento teste"
  vpc_id      = aws_vpc.mtc_vpc.id

  # Regras de entrada, permitindo tráfego HTTP de qualquer origem e SSH apenas do IP específico
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.trusted_ip_cidr]
  }

  # Regra de saída, permitindo todo o tráfego de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Criando um key pair
resource "aws_key_pair" "mtc_auth" {
  key_name   = "devkey"
  public_key = file("~/.ssh/devkey.pub")
}

# Criando uma máquina virtual
resource "aws_instance" "dev_test_instance"{
  instance_type = "t3.micro"
  ami = data.aws_ami.amazon_linux_2023.id

  user_data = file("userdata.sh")

  tags = {
    Name = "dev_test_instance"
  }

  key_name = aws_key_pair.mtc_auth.key_name
  vpc_security_group_ids = [aws_security_group.mtc_sg.id]
  subnet_id = aws_subnet.mtp_public_subnet.id

  #Configurando o tamanho do volume
  root_block_device {
    volume_size = 8
  }
}

# Mostra o IP público da instância
output "public_ip" {
  value = aws_instance.dev_test_instance.public_ip
}