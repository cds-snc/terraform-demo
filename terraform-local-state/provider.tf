terraform {
  required_version = "= 1.0.11"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.67.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}
