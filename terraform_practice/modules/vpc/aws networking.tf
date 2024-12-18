provider "aws" {
  region = "eu-north-1" 
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/0" 

  tags = {
    Name = "main-vpc"
  }
}

# Create Public Subnets (in separate availability zones)
resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/0" 
  availability_zone = "eu-north-1a" 
  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-north-1b" 
  tags = {
    Name = "public-subnet-b"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

# Create a Route Table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-route-table"
  }
}

# Create Route associating the internet gateway with the public subnets
resource "aws_route" "internet_route" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

# Associate the route table with the subnets
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "public_b" {
 subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.main.id
}
