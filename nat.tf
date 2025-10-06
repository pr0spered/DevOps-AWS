# Elastic IP for NAT Gateway in az1
resource "aws_eip" "ecomm-az1-eip" {
  domain = "vpc"
}

# NAT Gateway in az1
resource "aws_nat_gateway" "ecomm-az1-nat" {
  subnet_id     = aws_subnet.ecomm-fe-sub-az1.id
  allocation_id = aws_eip.ecomm-az1-eip.id
  depends_on    = [aws_internet_gateway.e-comm]

  tags = {
    Name = "ecomm-nat-az1"
  }
}

# Elastic IP for NAT Gateway in az2
resource "aws_eip" "ecomm-az2-eip" {
  domain = "vpc"
}

# NAT Gateway in az2
resource "aws_nat_gateway" "ecomm-az2-nat" {
  subnet_id     = aws_subnet.ecomm-fe-sub-az2.id
  allocation_id = aws_eip.ecomm-az2-eip.id
  depends_on    = [aws_internet_gateway.e-comm]

  tags = {
    Name = "ecomm-nat-az2"
  }
}