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
  }))
}

variable "private_subnets" {
  type = list(object({
    az = string
    cidr_block = string
    subnet_type = string
  }))
}
