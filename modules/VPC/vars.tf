variable "region" {
  type    = string
  default = "us-east-1"
}

variable "AWS_ACCESS_KEY" {
  type    = string
  default = "access key"
}

variable "AWS_SECRET_KEY" {
  type    = string
  default = "secret key"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "terraform_vpc"
}

variable "public_subnets" {
  default = [
    {
      az = "us-east-1a"
      cidr_block = "10.0.1.0/24"
      subnet_type = "public"
      map_public_ip_on_launch = true
    }
  ]
}

variable "private_subnets" {
  default = [
    {
      az = "us-east-1b"
      cidr_block = "10.0.2.0/24"
      subnet_type = "private"
      map_public_ip_on_launch = false
    }
  ]
}

variable "public_ec2_ami" {
  default = "ami-00dc79254d0461090"
}

variable "public_ec2_instance_type" {
  default = "t2.micro"
}

variable "public_ec2_instance_name" {
  default = "terraform_web_server"
}

variable "private_ec2_ami" {
  default = "ami-00dc79254d0461090"
}

variable "private_ec2_instance_type" {
  default = "t2.micro"
}

variable "private_ec2_instance_name" {
  default = "terraform_web_server"
}

variable "public_sg_name" {
  default = "web_dmz"
}

variable "sg_ingress_rules" {
  default = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
    }
  ]
}
