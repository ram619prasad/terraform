variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "AWS_ACCESS_KEY" {
  type    = "string"
  default = "AKIAW3TRK4QEZ7AAWT5N"
}

variable "AWS_SECRET_KEY" {
  type    = "string"
  default = "IGW6sg86wSguXAcIO/bPRXGdCbWYhsHsfLGIR99L"
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
    }
  ]
}

variable "private_subnets" {
  default = [
    {
      az = "us-east-1b"
      cidr_block = "10.0.2.0/24"
      subnet_type = "private"
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
