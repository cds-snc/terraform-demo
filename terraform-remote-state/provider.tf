terraform {
  required_version = "= 1.0.11"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.67.0"
    }
  }

  backend "s3" {
    bucket         = "unique-bucket-name-for-a-local-state-demo"
    key            = "terraform.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "ca-central-1"
}
