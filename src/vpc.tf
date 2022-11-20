# VPC resource
#-------------------------------
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
 
  tags = {
    Name = "my-terraform-aws-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  count      = "${length(var.public_subnet_cidr_block)}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.public_subnet_cidr_block, count.index)}"
  
  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = local.common_tags
}

resource "aws_subnet" "private_subnet" {
  count      = "${length(var.private_subnet_cidr_block)}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.private_subnet_cidr_block, count.index)}"

  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = {
    Name = "private_subnet_${count.index}"
  }
}

resource "aws_subnet" "database_subnet" {
  count      = "${length(var.database_subnet_cidr_block)}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.database_subnet_cidr_block, count.index)}"

  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = {
    Name = "database_subnet_${count.index}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"
}

# EIP and NAT Gateway
resource "aws_eip" "nat_eip" {
  vpc      = true
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${element(aws_subnet.public_subnet.*.id, 1)}"

  depends_on = ["aws_internet_gateway.igw"]
}