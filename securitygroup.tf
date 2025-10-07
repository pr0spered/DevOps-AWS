# Security Group for Application Load Balancer
resource "aws_security_group" "ecomm-sec-alb" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "ecomm-sec-grp-alb"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-https-alb" {
  security_group_id = aws_security_group.ecomm-sec-alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-http-alb" {
  security_group_id = aws_security_group.ecomm-sec-alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "ecomm-out-alb" {
  security_group_id = aws_security_group.ecomm-sec-alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Security Group for Bastion Host
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
  security_group_id = aws_security_group.ecomm-sec-alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}