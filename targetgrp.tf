# Target Group for frontend
resource "aws_lb_target_group" "ecomm-tg-fe" {
  name     = "ecomm-tg-fe"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.e-comm.id

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    protocol            = "HTTP"
  }
}

# Attaching Target Group to Load Balancer
resource "aws_lb_target_group_attachment" "a1" {
  target_group_arn = aws_lb_target_group.ecomm-tg-fe.arn
  target_id        = aws_lb.ecomm-alb-fe.id
}

# Target Group for backend
resource "aws_lb_target_group" "ecomm-tg-be" {
  name     = "ecomm-tg-be"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.e-comm.id

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    protocol            = "HTTP"
  }
}

# Attaching Target Group to Load Balancer
resource "aws_lb_target_group_attachment" "a2" {
  target_group_arn = aws_lb_target_group.ecomm-tg-be.arn
  target_id        = aws_lb.ecomm-alb-be.id
}