# Application Load Balancer Listener
resource "aws_lb_listener" "ecomm-listener" {
  load_balancer_arn = aws_lb.ecomm-alb-fe.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecomm-tg.arn
  }
}