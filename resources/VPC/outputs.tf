output "cidr_block" {
  value = aws_vpc.terraform_vpc.cidr_block
}

output "arn" {
  value = aws_vpc.terraform_vpc.arn
}

output "tags" {
  value = aws_vpc.terraform_vpc.tags
}

output "public_subnets" {
  value = aws_subnet.public_subnets
}

output "private_subnets" {
  value = aws_subnet.private_subnets
}

output "gateway_id" {
  value = aws_internet_gateway.terraform_gateway.id
}

output "gateway_tags" {
  value = aws_internet_gateway.terraform_gateway.tags
}

output "public_security_groups" {
  value = aws_security_group.web_dmz
}

output "private_security_groups" {
  value = aws_security_group.private_sg
}
