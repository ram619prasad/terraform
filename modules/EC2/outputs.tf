output "arn" {
  value = module.ec2.arn
}

output "public_ip" {
  value = module.ec2.public_ip
}

output "private_ip" {
  value = module.ec2.private_ip
}

output "instance_state" {
  value = module.ec2.instance_state
}

output "tags" {
  value = module.ec2.tags
}

output "elastic_ip" {
  value = module.ec2.elastic_ip
}

output "key_name" {
  value = module.ec2.key_name
}
