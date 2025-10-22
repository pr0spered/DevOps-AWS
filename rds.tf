# Database Instance
resource "aws_db_instance" "ecomm-db-inst" {
  identifier              = "ecomm-db"
  allocated_storage       = 20
  engine                  = "mysql"
  instance_class          = "db.t3.medium"
  password                = "12345678"
  username                = "admin"
  db_subnet_group_name    = aws_db_subnet_group.ecomm-db-sub-grp.name
  vpc_security_group_ids  = [aws_security_group.ecomm-sec-db.id]
  skip_final_snapshot     = true
  multi_az                = true
  backup_retention_period = 7

  tags = {
    Name = "ecomm-db"
  }
}

# Database Instance Replica
resource "aws_db_instance" "ecomm-db-repl" {
  identifier              = "ecomm-db-replica"
  instance_class          = "db.t3.medium"
  replicate_source_db     = aws_db_instance.ecomm-db-inst.identifier
  availability_zone       = "ap-southeast-1b"
  vpc_security_group_ids  = [aws_security_group.ecomm-sec-db.id]
  backup_retention_period = 7

  tags = {
    Name = "ecom-db-replica"
  }
}