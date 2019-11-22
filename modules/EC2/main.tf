module "ec2" {
  source = "../../resources/EC2"

  ec2_config = var.ec2_config
}
