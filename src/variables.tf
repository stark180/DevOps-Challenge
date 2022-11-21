# Input Variables

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "eu-west-3"  
}

variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "prod"
}

variable "business_division" {
  description = "Business Division this Infrastructure belongs"
  type = string
  default = "jumia"
}

variable "availability_zones" {
   type = list(string)
   description = "AWS Region Availability Zones"
}

variable "public_subnet_cidr_block" {
   type = list(string)
   description = "Public Subnet CIDR Block"
}

variable "private_subnet_cidr_block" {
   type = list(string)
   description = "Private Subnet CIDR Block"
}

variable "database_subnet_cidr_block" {
   type = list(string)
   description = "Database Subnet CIDR Block"
}

# key variable for refrencing 
variable "key_name" {
  default = "ec2Key"    
}

# base_path for refrencing 
variable "base_path" {
  default = "mac/Users/oscar/Documents/sshkeys/"
}