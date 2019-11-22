# The following are implemented with this terraform script
#   1. Create an ec2 instance(ubuntu) with specified config.
#   2. Create an elastic ip and attach it to the ec2 creted in step 1
#   3. Create a local ssh key and add it to the ec2 instance for SSH-ing.
#         ssh-keygen -f <some_name>


locals {
  ssh_key_name = "temp_key"
  has_vpc = false
}

resource "aws_key_pair" "ramp_us_east_1" {
  key_name   = local.ssh_key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLEW8n5wDF3h2fQvrKY7Q+5CpgVz8/QMlyuS4WzFIGGpTaDKwyuGKH0Ph2mCwXmkkEVQGLBLixDlDmSTIfqGsEgq2JDbR7BmM8Luz5ANFGARafmLHnlKYGJ5IoSAjtSGhuJ21A6noLBzzPh7xLidXIp6T17thSq9IaojhIVxWHRuXB8/oAB1hjAUHyAK/x+9Xcixs8xG3DwVz5JHwhPIHMDlEZwm32QIrgTdTjLYIbn0QI7b1htqYheqVt0DtvAoYn57F0jEN3mG2UINCmFC1Wy+o4JbKdLIzeQPZlj3IfOGKce7lw2qTGQoPJEbSczMs46D+U4mI0F8FlIa9JJQZp rpr_maddi@rampraseddysmbp"
}

resource "aws_instance" "web_server" {
  count = length(var.ec2_config)

  ami           = var.ec2_config[count.index]["ec2_ami"]
  instance_type = var.ec2_config[count.index]["ec2_instance_type"]
  key_name      = coalesce(var.ec2_config[count.index]["ssh_key_name"], aws_key_pair.ramp_us_east_1.key_name)
  subnet_id     = var.ec2_config[count.index]["subnet_id"]

  tags = {
    Name        = "${var.ec2_config[count.index]["ec2_instance_name"]} - ${count.index}"
    Environment = "Terraform"
  }
}

resource "aws_eip" "web_server_eip" {
  count = length(aws_instance.web_server)

  vpc      = false
  instance = aws_instance.web_server[count.index]["id"]
}
