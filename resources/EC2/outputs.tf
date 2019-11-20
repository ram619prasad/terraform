output "arn" {
  value = aws_instance.web_server.arn
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "private_ip" {
  value = aws_instance.web_server.private_ip
}

output "instance_state" {
  value = aws_instance.web_server.instance_state
}

output "tags" {
  value = aws_instance.web_server.tags
}

output "elastic_ip" {
  value = aws_eip.web_server_eip.public_ip
}

output "key_name" {
  value = aws_instance.web_server.key_name
}
