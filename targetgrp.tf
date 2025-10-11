# Target Group
resource "aws_lb_target_group" "ecomm-tg" {
  name     = "ecomm-tg"
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
  target_group_arn = aws_lb_target_group.ecomm-tg.arn
  target_id        = aws_lb.ecomm-alb-fe.id
}