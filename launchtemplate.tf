# Launch Template for frontend EC2 instances
resource "aws_launch_template" "ecomm-launch-temp-fe" {
  image_id               = data.aws_ami.amazon-linux-2023.image_id
  instance_type          = "t2.micro"
  key_name               = "sing_01"
  vpc_security_group_ids = [aws_security_group.ecomm-sec-fe.id]

  network_interfaces {
    security_groups             = [aws_security_group.ecomm-sec-fe.id]
    associate_public_ip_address = true
  }

  tags = {
    Name = "ecomm-launch-temp-fe"
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