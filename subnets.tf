# Public Subnets
## frontend
resource "aws_subnet" "ecomm-fe-sub-az1" {
  vpc_id                  = aws_vpc.e-comm.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "sub-pub-1"
  }
}

resource "aws_subnet" "ecomm-fe-sub-az2" {
  vpc_id                  = aws_vpc.e-comm.id
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "sub-pub-2"
  }
}

# Private Subnets
## backend
resource "aws_subnet" "ecomm-be-sub-az1" {
  vpc_id            = aws_vpc.e-comm.id
  cidr_block        = "10.0.100.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "sub-pvt-1"
  }
}

resource "aws_subnet" "ecomm-be-sub-az2" {
  vpc_id            = aws_vpc.e-comm.id
  cidr_block        = "10.0.110.0/24"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "sub-pvt-2"
  }
}

## database
resource "aws_subnet" "ecomm-db-sub-az1" {
  vpc_id            = aws_vpc.e-comm.id
  cidr_block        = "10.0.120.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "sub-pvt-3"
  }
}

resource "aws_subnet" "ecomm-db-sub-az2" {
  vpc_id            = aws_vpc.e-comm.id
  cidr_block        = "10.0.130.0/24"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "sub-pvt-4"
  }
}