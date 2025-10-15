# Security Group with inbound and outbound rules for frontend Application Load Balancer
resource "aws_security_group" "ecomm-sec-alb-fe" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "ecomm-sec-grp-alb-fe"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-https-alb-fe" {
  security_group_id = aws_security_group.ecomm-sec-alb-fe.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-http-alb-fe" {
  security_group_id = aws_security_group.ecomm-sec-alb-fe.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "ecomm-out-alb" {
  security_group_id = aws_security_group.ecomm-sec-alb-fe.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Security Group with inbound and outbound rules for backend Application Load Balancer
resource "aws_security_group" "ecomm-sec-alb-be" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "ecomm-sec-grp-alb-be"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-https-alb-be" {
  security_group_id = aws_security_group.ecomm-sec-alb-be.id
  referenced_security_group_id = aws_security_group.ecomm-sec-fe.id
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-http-alb-be" {
  security_group_id = aws_security_group.ecomm-sec-alb-be.id
  referenced_security_group_id = aws_security_group.ecomm-sec-fe.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "ecomm-out-alb-be" {
  security_group_id = aws_security_group.ecomm-sec-alb-be.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Security Group with inbound and outbound rules for Bastion Host
resource "aws_security_group" "ecomm-sec-bh" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "ecomm-sec-grp-bh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-ssh-bh" {
  security_group_id = aws_security_group.ecomm-sec-bh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "ecomm-out-bh" {
  security_group_id = aws_security_group.ecomm-sec-bh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Security Group with inbound and outbound rules for Backend
resource "aws_security_group" "ecomm-sec-be" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "ecomm-sec-grp-be"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-icmp-be" {
  security_group_id = aws_security_group.ecomm-sec-be.id
  referenced_security_group_id = aws_security_group.ecomm-sec-fe.id
  ip_protocol       = "icmp"
  from_port         = -1
  to_port           = -1
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-ssh-be" {
  security_group_id = aws_security_group.ecomm-sec-be.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "ecomm-out-be" {
  security_group_id = aws_security_group.ecomm-sec-be.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Security Group with inbound and outbound rules for Database
resource "aws_security_group" "ecomm-sec-db" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "ecomm-sec-grp-db"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-mysql-db" {
  security_group_id = aws_security_group.ecomm-sec-db.id
  referenced_security_group_id = aws_security_group.ecomm-sec-be.id
  ip_protocol       = "tcp"
  from_port         = 3306
  to_port           = 3306
}

resource "aws_vpc_security_group_egress_rule" "ecomm-out-db" {
  security_group_id = aws_security_group.ecomm-sec-db.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Security Group with inbound and outbound rules for EC2 server
resource "aws_security_group" "ecomm-sec-ec2" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "ecomm-sec-grp-ec2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-https-ec2" {
  security_group_id = aws_security_group.ecomm-sec-ec2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-http-ec2" {
  security_group_id = aws_security_group.ecomm-sec-ec2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "ecomm-out-ec2" {
  security_group_id = aws_security_group.ecomm-sec-ec2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Security Group with inbound and outbound rules for Frontend
resource "aws_security_group" "ecomm-sec-fe" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "ecomm-sec-grp-fe"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-https-fe" {
  security_group_id = aws_security_group.ecomm-sec-fe.id
  referenced_security_group_id = aws_security_group.ecomm-sec-alb-fe.id
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-http-fe" {
  security_group_id = aws_security_group.ecomm-sec-fe.id
  referenced_security_group_id = aws_security_group.ecomm-sec-alb-fe.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-ssh-fe" {
  security_group_id = aws_security_group.ecomm-sec-fe.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "ecomm-out-fe" {
  security_group_id = aws_security_group.ecomm-sec-fe.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}