# Application Load Balancer Listener for frontend
resource "aws_lb_listener" "ecomm-listener-fe" {
  load_balancer_arn = aws_lb.ecomm-alb-fe.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecomm-tg-be.arn
  }
}

# # Application Load Balancer Listener for backend
# resource "aws_lb_listener" "ecomm-listener-be" {
#   load_balancer_arn = aws_lb.ecomm-alb-be.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ecomm-tg-be.arn
#   }
# }