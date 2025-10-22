# # Target Group for frontend
# resource "aws_lb_target_group" "ecomm-tg-fe" {
#   name     = "ecomm-tg-fe"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.e-comm.id

#   health_check {
#     healthy_threshold   = 3
#     unhealthy_threshold = 2
#     protocol            = "HTTP"
#   }
# }

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