# Public Subnets
resource "aws_subnet" "ecomm-sub-1" {
  vpc_id                  = aws_vpc.a1.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "sub-pub-1"
  }
}

resource "aws_subnet" "ecomm-sub-2" {
  vpc_id                  = aws_vpc.a1.id
  cidr_block              = "10.0.16.0/24"
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "sub-pub-2"
  }
}

# Private Subnets
resource "aws_subnet" "ecomm-sub-3" {
  vpc_id            = aws_vpc.a1.id
  cidr_block        = "10.0.128.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "sub-pvt-1"
  }
}

resource "aws_subnet" "ecomm-sub-4" {
  vpc_id            = aws_vpc.a1.id
  cidr_block        = "10.0.144.0/24"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "sub-pvt-2"
  }
}

resource "aws_subnet" "ecomm-sub-5" {
  vpc_id            = aws_vpc.a1.id
  cidr_block        = "10.0.160.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "sub-pvt-3"
  }
}

resource "aws_subnet" "ecomm-sub-6" {
  vpc_id            = aws_vpc.a1.id
  cidr_block        = "10.0.176.0/24"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "sub-pvt-4"
  }
}