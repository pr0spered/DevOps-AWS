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

# Private Route Table for backend az1
resource "aws_route_table" "ecomm-pvt-rt-be-az1" {
  vpc_id = aws_vpc.e-comm.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ecomm-az1-nat.id
  }

  tags = {
    Name = "route-table-pvt-az1"
  }
}

# Private Route Table for backend az2
resource "aws_route_table" "ecomm-pvt-rt-be-az2" {
  vpc_id = aws_vpc.e-comm.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ecomm-az2-nat.id
  }

  tags = {
    Name = "route-table-pvt-az2"
  }
}

# Private Route Table for database
resource "aws_route_table" "ecomm-pvt-rt-db" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "route-table-pvt-db"
  }
}