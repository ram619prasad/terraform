# The following are implemented with this terraform script
#   1. Create an ec2 instance(ubuntu)
#   2. Create an elastic ip and attach it to the ec2 creted in step 1
#   3. Create a local ssh key and add it to the ec2 instance for SSH-ing.
#         ssh-keygen -f <some_name>


locals {
  ssh_key_name = "temp_key"
}

resource "aws_key_pair" "ramp_us_east_1" {
  key_name   = local.ssh_key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDah4EwCOEn5P4lAXFF/PC0pJVGY5cpm6ClgitZv4p0QUmgrgAZOfhpyKpnkI2+371txOroIdDd4Aw5w0+X1G3UhsrdxPif4moT3cL+gV7ZubCy8Pto4kuvf9ypdG5SsSyoud6nH/D9RtQyAR88U5dyuYVW6W7ELigCBTT/1f2ls6o1OUMIefnxUaUJITKuOVhdz6pM7Cr63osZwPz7yn/AgXszKcgJgX7+a/naRtn4075AUPqIv565cG1AqzG4/zjGoir4jSuFY/hVOCELxVib2EqLszNC0b0LCEnGwRRh2kvlGSZjX/axzuZgUjtI3tez4mxDLWwIZeQ3htpDPbK/ rpr_maddi@192.168.1.6"
}

resource "aws_instance" "web_server" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = coalesce(var.ssh_key_name, aws_key_pair.ramp_us_east_1.key_name)

  tags = {
    Name        = var.ec2_instance_name
    Environment = "Terraform"
  }
}

resource "aws_eip" "web_server_eip" {
  vpc      = false
  instance = aws_instance.web_server.id
}
