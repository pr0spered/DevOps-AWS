# Database Subnet Group
resource "aws_db_subnet_group" "ecomm-db-sub-grp" {
  subnet_ids = [aws_subnet.ecomm-db-sub-az1.id, aws_subnet.ecomm-db-sub-az2.id]

  tags = {
    Name = "ecomm-db-sub"
  }
}
