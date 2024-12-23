terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Create Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = data.aws_vpc.default.id

  tags = {
    Name = "Main IGW"
  }
}

# Get default subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Create DB subnet group
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = data.aws_subnets.default.ids

  tags = {
    Name = "My DB subnet group"
  }
}

# Create RDS instance
resource "aws_db_instance" "rds_instance" {
  identifier           = "my-rds-instance"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  db_name             = "mydb"
  username            = "admin"
  password            = "ujwal123456"
  
  # Network settings
  db_subnet_group_name = aws_db_subnet_group.default.name
  publicly_accessible  = true
  
  # Other settings
  skip_final_snapshot = true
  
  tags = {
    Name        = "MySQL RDS Instance"
    Environment = "Development"
  }
}
