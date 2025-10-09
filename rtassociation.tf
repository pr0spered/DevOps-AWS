# Associate public frontend subnet az1 to public route table
resource "aws_route_table_association" "ecomm-rta-01" {
  subnet_id      = aws_subnet.ecomm-fe-sub-az1.id
  route_table_id = aws_route_table.ecomm-pub-rt.id
}

# Associate public frontend subnet az2 to public route table
resource "aws_route_table_association" "ecomm-rta-02" {
  subnet_id      = aws_subnet.ecomm-fe-sub-az2.id
  route_table_id = aws_route_table.ecomm-pub-rt.id
}

# Associate private backend subnet az1 to private backend az1 route table
resource "aws_route_table_association" "ecomm-rta-03" {
  subnet_id      = aws_subnet.ecomm-be-sub-az1.id
  route_table_id = aws_route_table.ecomm-pvt-rt-be-az1.id
}

# Associate private backend subnet az2 to private backend az2 route table
resource "aws_route_table_association" "ecomm-rta-04" {
  subnet_id      = aws_subnet.ecomm-be-sub-az2.id
  route_table_id = aws_route_table.ecomm-pvt-rt-be-az2.id
}

# Associate private database subnet az1 to private database route table
resource "aws_route_table_association" "ecomm-rta-05" {
  subnet_id      = aws_subnet.ecomm-db-sub-az1.id
  route_table_id = aws_route_table.ecomm-pvt-rt-db.id
}

# Associate private database subnet az2 to private database route table
resource "aws_route_table_association" "ecomm-rta-06" {
  subnet_id      = aws_subnet.ecomm-db-sub-az2.id
  route_table_id = aws_route_table.ecomm-pvt-rt-db.id
}