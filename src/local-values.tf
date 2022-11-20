# ================ local tags ============
locals {
  owners = var.business_division
  environment = var.environment
  name = "${var.business_division}-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
} 

locals {
  availability_zones = ["eu-west-3a","eu-west-3b"]

  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}