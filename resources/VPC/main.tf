// List of tasks involved with this script
//  1. Create a VPC
//  2. Create public_subnets as specified in the module inputs(for now 1)
//  3. Create private_subnets as specified in the module inputs(for now 1)
//  4. Attach an internet gateway to the VPC
//  5. Launch an ec2 instance in public and private subnets.
//        - Add Security groups for SSH and public access to instance in public subnet
//        - Add Security group to private subnet to allow traffic only from public subnet instances
//  6. Create a secondary route table for the VPC to allow the internet traffic
//  7. Change the public subnet to use the secondary route table
//  8. Create NAT Gateways in each of public instances for internet access to private instances for any os updates.

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
  map_public_ip_on_launch = var.public_subnets[count.index]["map_public_ip_on_launch"]

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
  map_public_ip_on_launch = var.private_subnets[count.index]["map_public_ip_on_launch"]

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

resource "aws_security_group" "web_dmz" {
  vpc_id = aws_vpc.terraform_vpc.id
  name   = var.public_sg_name
  description = var.public_sg_name

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    iterator = sg_ingress_rule

    content {
      cidr_blocks = sg_ingress_rule.value["cidr_blocks"]
      from_port   = sg_ingress_rule.value["from_port"]
      to_port     = sg_ingress_rule.value["to_port"]
      protocol    = sg_ingress_rule.value["protocol"]
    }
  }

  tags = {
    Name = "${var.public_sg_name}-sg"
    Environment = "terraform"
  }
}

locals {
  public_sg_cidr_blocks = flatten([for sg in aws_subnet.public_subnets: sg["cidr_block"]])
  public_sg_ids = flatten([for sg in aws_subnet.public_subnets: sg["id"]])
}

resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.terraform_vpc.id
  name   = var.private_sg_name
  description = var.private_sg_name

  ingress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = local.public_sg_cidr_blocks
  }

  tags = {
    Name = "${var.private_sg_name}-sg"
    Environment = "terraform"
  }
}

resource "aws_route_table" "secondary_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_gateway.id
  }

  tags = {
    Name        = "secondary_route_table"
    Environment = "terraform"
  }
}

resource "aws_route_table_association" "public_subnet_routes" {
  count = length(local.public_sg_ids)

  subnet_id      = local.public_sg_ids[count.index]
  route_table_id = aws_route_table.secondary_route_table.id
}

resource "aws_eip" "gateway_eip" {
  count  = length(local.public_sg_ids)
}

locals {
  gateway_eips_ids = flatten([for eip in aws_eip.gateway_eip : eip["id"]])
}

resource "aws_nat_gateway" "nat_gateways" {
  depends_on    = [aws_internet_gateway.terraform_gateway, aws_eip.gateway_eip]
  count         = length(local.gateway_eips_ids)

  allocation_id = local.gateway_eips_ids[count.index]
  subnet_id     = local.public_sg_ids[count.index]
}
