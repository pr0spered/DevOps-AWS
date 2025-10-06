# Internet Gateway
resource "aws_internet_gateway" "e-comm" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "ecomm-igw"
  }
}