variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "AWS_ACCESS_KEY" {
  type    = "string"
  default = "access key"
}

variable "AWS_SECRET_KEY" {
  type    = "string"
  default = "secret key"
}

variable "ec2_config" {
  default = [
    {
      ec2_ami = "ami-00dc79254d0461090"
      ec2_instance_type = "t2.micro"
      ec2_instance_name = "terraform_web_server"
      subnet_id = "subnet-5abec264"
      ssh_key_name = null
    }
  ]
}
