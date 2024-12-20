terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"

}
resource "aws_instance" "name" {
  ami = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
}
