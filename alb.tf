# Application Load Balancer for frontend
resource "aws_lb" "ecomm-alb-fe" {
  name               = "lb-fe"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.ecomm-sec-alb-fe.id]
  subnets            = [aws_subnet.ecomm-fe-sub-az1.id, aws_subnet.ecomm-fe-sub-az2.id]

  tags = {
    Name = "ecomm-alb"
  }
}

# Application Load Balancer for backend
resource "aws_lb" "ecomm-alb-be" {
  name               = "lb-be"
  load_balancer_type = "application"
  internal           = true
  security_groups    = [aws_security_group.ecomm-sec-alb-be.id]
  subnets            = [aws_subnet.ecomm-be-sub-az1.id, aws_subnet.ecomm-be-sub-az2.id]

  tags = {
    Name = "ecomm-alb-be"
  }
}