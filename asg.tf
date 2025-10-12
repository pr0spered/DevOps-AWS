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

# Attatching Auto Scaling Group to Load Balancer Target Group
resource "aws_autoscaling_attachment" "ecomm-asg-lb-attach" {
  autoscaling_group_name = aws_autoscaling_group.ecomm-asg-fe.name
  lb_target_group_arn    = aws_lb_target_group.ecomm-tg-fe.arn
}

# Auto Scaling Group for backend
resource "aws_autoscaling_group" "ecomm-asg-be" {
  name                = "ecomm-asg-be"
  min_size            = 2
  max_size            = 5
  desired_capacity    = 2
  health_check_type   = "ELB"
  vpc_zone_identifier = [aws_subnet.ecomm-be-sub-az1.id, aws_subnet.ecomm-be-sub-az2.id]

  launch_template {
    id      = aws_launch_template.ecomm-launch-temp-be.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ecomm-asg-be"
    propagate_at_launch = true
  }
}

# Attatching Auto Scaling Group to Load Balancer Target Group
resource "aws_autoscaling_attachment" "ecomm-asg-lb-attach-be" {
  autoscaling_group_name = aws_autoscaling_group.ecomm-asg-be.name
  lb_target_group_arn    = aws_lb_target_group.ecomm-tg-be.arn
}