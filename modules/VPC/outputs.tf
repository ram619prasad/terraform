output "cidr_block" {
  value = module.vpc.cidr_block
}

output "arn" {
  value = module.vpc.arn
}

output "tags" {
  value = module.vpc.tags
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "gateway_id" {
  value = module.vpc.gateway_id
}

output "gateway_tags" {
  value = module.vpc.gateway_tags
}

output "public_instances" {
  value = module.public_instances
}

output "private_instances" {
  value = module.private_instances
}

output "public_security_groups" {
  value = module.vpc.public_security_groups
}

output "private_security_groups" {
  value = module.vpc.private_security_groups
}

output "gateway_eip_public_ips" {
  value = module.vpc.gateway_eip_public_ips
}

output "nat_gateways" {
  value = module.vpc.nat_gateways
}
