terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
   # backend depends on s3 bucket creation
  backend "s3" {
    bucket         = "api-tf-state-backend-ci-cd"
    key            = "tf-infra/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
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