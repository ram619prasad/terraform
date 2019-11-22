// List of tasks involved with this script
//  1. Create a VPC
//  2. Create public_subnets as specified in the module inputs(for now 1)
//  3. Create private_subnets as specified in the module inputs(for now 1)
//  4. Attach an internet gateway to the VPC
//  5. Launch an ec2 instance in public and private subnets.
//        - Add Security groups for SSH and public access to instance in public subnet

resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name        = var.vpc_name
    Environment = "terraform"
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id     = aws_vpc.terraform_vpc.id
  count = length(var.public_subnets)

  cidr_block = var.public_subnets[count.index]["cidr_block"]
  availability_zone = var.public_subnets[count.index]["az"]

  tags = {
    Name = "${var.public_subnets[count.index]["subnet_type"]} - ${var.public_subnets[count.index]["cidr_block"]} - ${var.public_subnets[count.index]["az"]}"
    Environment = "terraform"
  }
}

resource "aws_subnet" "private_subnets" {
  vpc_id     = aws_vpc.terraform_vpc.id
  count = length(var.private_subnets)

  cidr_block = var.private_subnets[count.index]["cidr_block"]
  availability_zone = var.private_subnets[count.index]["az"]

  tags = {
    Name = "${var.private_subnets[count.index]["subnet_type"]} - ${var.private_subnets[count.index]["cidr_block"]} - ${var.private_subnets[count.index]["az"]}"
    Environment = "terraform"
  }
}

resource "aws_internet_gateway" "terraform_gateway" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "${var.vpc_name}-gateway"
    Environment = "terraform"
  }
}
