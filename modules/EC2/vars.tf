variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "AWS_ACCESS_KEY" {
  type    = "string"
  default = "your access key pls"
}

variable "AWS_SECRET_KEY" {
  type    = "string"
  default = "your secret key pls"
}

variable "ec2_ami" {
  default = "ami-00dc79254d0461090"
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "ec2_instance_name" {
  default = "terraform_web_server"
}
