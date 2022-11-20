resource "aws_vpc" "apiVPC" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name    = "apiVPC"
    Project = "api TF jumia"
  }
}