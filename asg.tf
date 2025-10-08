# Auto Scaling Group
resource "aws_autoscaling_group" "ecomm-asg" {
  name                = "ecomm-asg"
  min_size            = 2
  max_size            = 5
  desired_capacity    = 2
  health_check_type   = "ELB"
  vpc_zone_identifier = [aws_subnet.ecomm-be-sub-az1.id, aws_subnet.ecomm-be-sub-az2.id]

  launch_template {
    id      = aws_launch_template.ecomm-launch-temp.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ecomm-asg"
    propagate_at_launch = true
  }
}