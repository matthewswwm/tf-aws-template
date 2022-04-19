output "single_public_ip" {
  description = "The public IP of the instance"
  value       = aws_instance.single_instance.public_ip
}
