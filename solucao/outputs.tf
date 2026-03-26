output "public_ip" {
  description = "IP público da instância"
  value       = aws_instance.web.public_ip
}