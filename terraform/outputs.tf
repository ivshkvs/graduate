output "bot_public_ip" {
  value = aws_eip.web.public_ip
}
