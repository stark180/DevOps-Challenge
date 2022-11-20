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