terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"

    }
  }

  backend "s3" {
    bucket         = "devops-recipe-app-tf-state-file"
    key            = "tf-state-setup"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "devops-recipe-app-api-tf-lock"
  }
}

provider "aws" {
  region = "eu-north-1"
  default_tags {
    tags = {
      Environment = var.project
      Project     = var.project
      contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}
