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

variable "ec2_config" {
  default = [
    {
      ec2_ami = "ami-00dc79254d0461090"
      ec2_instance_type = "t2.micro"
      ec2_instance_name = "terraform_web_server"
      subnet_id = "subnet-5abec264"
      ssh_key_name = null
      security_groups = []
    }
  ]
}
