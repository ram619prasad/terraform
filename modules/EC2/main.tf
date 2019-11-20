module "ec2" {
  source = "../../resources/EC2"

  ec2_ami           = var.ec2_ami
  ec2_instance_type = var.ec2_instance_type
  ec2_instance_name = var.ec2_instance_name
}
