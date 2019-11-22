output "ec2" {
  value = module.ec2.web_server
}

output "elastic_ips" {
  value = module.ec2.elastic_ips
}
