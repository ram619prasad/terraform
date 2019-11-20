variable "ec2_ami" {
  type = "string"
}

variable "ec2_instance_type" {
  type = "string"
}

variable "ec2_instance_name" {
  type = "string"
}

variable "ssh_key_name" {
  type = "string"
  default = null
}
