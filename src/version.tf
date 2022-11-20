terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "jumiadevopschallenge180"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-3"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }

    
}

# Provider Block
provider "aws" {
  region  = var.aws_region
}



