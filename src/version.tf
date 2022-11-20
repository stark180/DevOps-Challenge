terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

  }

  
}

# Provider Block
provider "aws" {
  region  = var.aws_region
}

#============= state files backend module ==========
module "tf-state" {
  source      = "./modules/tf-state"
  bucket_name = "api-tf-state-backend-ci-cd"
}