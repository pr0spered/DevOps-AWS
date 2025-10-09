# Auto Scaling Group for frontend
resource "aws_autoscaling_group" "ecomm-asg-fe" {
  name                = "ecomm-asg-fe"
  min_size            = 2
  max_size            = 5
  desired_capacity    = 2
  health_check_type   = "ELB"
  vpc_zone_identifier = [aws_subnet.ecomm-fe-sub-az1.id, aws_subnet.ecomm-fe-sub-az2.id]

  launch_template {
    id      = aws_launch_template.ecomm-launch-temp-fe.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ecomm-asg-fe"
    propagate_at_launch = true
  }
}