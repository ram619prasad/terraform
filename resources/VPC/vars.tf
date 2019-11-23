variable "vpc_cidr_block" {
  type = "string"
}

variable "vpc_name" {
  type = "string"
}

variable "public_subnets" {
  type = list(object({
    az = string
    cidr_block = string
    subnet_type = string
    map_public_ip_on_launch = bool
  }))
}

variable "private_subnets" {
  type = list(object({
    az = string
    cidr_block = string
    subnet_type = string
    map_public_ip_on_launch = bool
  }))
}

variable "public_sg_name" {
  default = "web_dmz"
}

variable "private_sg_name" {
  default = "private_sg"
}

variable "sg_ingress_rules" {
  type = list(object({
    cidr_blocks = list(string)
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}
