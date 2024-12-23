terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "s3-terraform-ujwal" 

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
