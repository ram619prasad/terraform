module "vpc" {
  source         = "../../resources/VPC"

  vpc_cidr_block  = var.vpc_cidr_block
  vpc_name        = var.vpc_name
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}
