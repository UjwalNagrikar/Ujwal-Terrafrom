# Create VPC
resource "aws_vpc" "ujwal-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MyfirstTerraform-vpc"
  }
}

# Create a public subnet
resource "aws_subnet" "publicSubnet" {
  vpc_id     = aws_vpc.ujwal-vpc.id
  cidr_block = "10.0.0.0/24" # Fixed the CIDR block format
}

# Create a private subnet
resource "aws_subnet" "privateSubnet" {
  vpc_id     = aws_vpc.ujwal-vpc.id
  cidr_block = "10.0.2.0/24"
}

# Create an Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.ujwal-vpc.id
}

# Create route table for public subnet
resource "aws_route_table" "PublicRoute" {
  vpc_id = aws_vpc.ujwal-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id # Fixed reference to Internet Gateway
  }
}

# Associate the public subnet with the public route table
resource "aws_route_table_association" "PublicRouteAssociation" {
  subnet_id      = aws_subnet.publicSubnet.id
  route_table_id = aws_route_table.PublicRoute.id
}
