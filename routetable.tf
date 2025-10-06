# Public Route Table
resource "aws_route_table" "ecomm-pub-rt" {
  vpc_id = aws_vpc.e-comm.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.e-comm.id
  }

  tags = {
    Name = "route-table-pub"
  }
}

# Private Route Table az1
resource "aws_route_table" "ecomm-pvt-rt-az1" {
  vpc_id = aws_vpc.e-comm.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ecomm-az1-nat.id
  }

  tags = {
    Name = "route-table-pvt-az1"
  }
}

# Private Route Table az2
resource "aws_route_table" "ecomm-pvt-rt-az2" {
  vpc_id = aws_vpc.e-comm.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ecomm-az2-nat.id
  }

  tags = {
    Name = "route-table-pvt-az2"
  }
}