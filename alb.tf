# Application Load Balancer
resource "aws_lb" "ecomm-alb" {
  name               = "lb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.ecomm-sec-alb.id]
  subnets            = [aws_subnet.ecomm-fe-sub-az1.id, aws_subnet.ecomm-fe-sub-az2.id]

  tags = {
    Name = "ecomm-alb"
  }
}