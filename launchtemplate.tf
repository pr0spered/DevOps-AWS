# Launch Template for Auto Scaling Group
resource "aws_launch_template" "ecomm-launch-temp" {
  image_id               = data.aws_ami.amazon-linux-2023.image_id
  instance_type          = "t2.micro"
  key_name               = "sing_01"
  vpc_security_group_ids = [aws_security_group.ecomm-sec-ec2.id]

  network_interfaces {
    security_groups             = [aws_security_group.ecomm-sec-ec2.id]
    associate_public_ip_address = false
  }

  tags = {
    Name = "ecomm-launch-temp"
  }
}

data "aws_ami" "amazon-linux-2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.9*-x86_64"]
  }

}