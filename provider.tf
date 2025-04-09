terraform {
  required_version = ">= 1.8" # Using a recent version

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.78" # Using a recent AWS provider version
    }
  }
}

provider "aws" {
  region = var.aws_region
  # Configure other provider settings like access keys, secret keys, or profiles if needed
  # By default, it uses the standard AWS credential chain (environment variables, shared credentials file, IAM role)
}