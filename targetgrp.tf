# Target Group
resource "aws_lb_target_group" "ecomm-tg" {
  name     = "ecomm-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.e-comm.id

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200,301,302"
    protocol            = "HTTP"
  }
}