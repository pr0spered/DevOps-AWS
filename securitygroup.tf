# Security Group with inbound and outbound rules for Application Load Balancer
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
  security_group_id = aws_security_group.ecomm-sec-alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# # Security Group with inbound and outbound rules for Backend
# resource "aws_security_group" "ecomm-sec-be" {
#   vpc_id = aws_vpc.e-comm.id

#   tags = {
#     Name = "ecomm-sec-grp-be"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "ecomm-https-be" {
#   security_group_id = aws_security_group.ecomm-sec-be.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "tcp"
#   from_port         = 443
#   to_port           = 443
# }

# resource "aws_vpc_security_group_ingress_rule" "ecomm-http-be" {
#   security_group_id = aws_security_group.ecomm-sec-be.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "tcp"
#   from_port         = 80
#   to_port           = 80
# }

# resource "aws_vpc_security_group_ingress_rule" "ecomm-ssh-be" {
#   security_group_id = aws_security_group.ecomm-sec-be.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "tcp"
#   from_port         = 22
#   to_port           = 22
# }

# resource "aws_vpc_security_group_egress_rule" "ecomm-out-be" {
#   security_group_id = aws_security_group.ecomm-sec-be.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1"
# }

# Security Group with inbound and outbound rules for Database
resource "aws_security_group" "ecomm-sec-db" {
  vpc_id = aws_vpc.e-comm.id

  tags = {
    Name = "ecomm-sec-grp-db"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-mysql-db" {
  security_group_id = aws_security_group.ecomm-sec-db.id
  cidr_ipv4         = "0.0.0.0/0"
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
  ip_protocol       = "HTTPS"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "ecomm-http-ec2" {
  security_group_id = aws_security_group.ecomm-sec-ec2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "HTTP"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "ecomm-out-ec2" {
  security_group_id = aws_security_group.ecomm-sec-ec2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}