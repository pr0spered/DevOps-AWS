# Database Subnet Group
resource "aws_db_subnet_group" "ecomm-db-sub-grp" {
  subnet_ids = [aws_subnet.ecomm-db-sub-az1, aws_subnet.ecomm-db-sub-az2]

  tags = {
    Name = "ecomm-db-sub"
  }
}
