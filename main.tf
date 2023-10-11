terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "aungkohtet"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  cloud {
    organization = "aungkohtet"
    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  access_key = "AKIA3PP3KODUXZCAP64M"
  secret_key = "E6C2LPJBjE8Sa+fGsn7zDqAiAkJfXDh8dGjiYT6U"
  region = "us-east-1"  # Replace with your desired AWS region 
}
provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  lower   = true
  upper   = false
  numeric = true  # Use `numeric` to include numeric characters
  special = false
  length  = 16
}

resource "aws_s3_bucket" "example" {
  bucket = "${random_string.bucket_name.result}-example"  # Appending a suffix for uniqueness
}

output "random_bucket_name" {
  value = aws_s3_bucket.example.bucket
}
