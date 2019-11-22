module "vpc" {
  source         = "../../resources/VPC"

  vpc_cidr_block  = var.vpc_cidr_block
  vpc_name        = var.vpc_name
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "public_instances" {
  source = "../../resources/EC2"

  ec2_config = flatten([
    for sn in module.vpc.public_subnets : [{
      ec2_ami = var.public_ec2_ami
      ec2_instance_type = var.public_ec2_instance_type
      ec2_instance_name = var.public_ec2_instance_name
      subnet_id = sn["id"]
      ssh_key_name = null
    }]
  ])
}

module "private_instances" {
  source = "../../resources/EC2"

  ec2_config = flatten([
    for sn in module.vpc.private_subnets : [{
      ec2_ami = var.private_ec2_ami
      ec2_instance_type = var.private_ec2_instance_type
      ec2_instance_name = var.private_ec2_instance_name
      subnet_id = sn["id"]
      ssh_key_name = null
    }]
  ])
}
