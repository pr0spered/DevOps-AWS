# Internet Gateway
resource "aws_internet_gateway" "e-comm" {
  vpc_id = aws_vpc.a1.id

  tags = {
    Name = "ecomm-igw"
  }
}