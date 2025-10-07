# Launch Template for Auto Scaling Group
resource "aws_launch_template" "ecomm-launch-temp" {
  image_id               = data.aws_ami.amazon-linux-2023.image_id
  instance_type          = "t2.micro"
  key_name               = "sing_01"
  vpc_security_group_ids = [aws_security_group.ecomm-sec-be.id]

  tags = {
    Name = "ecomm-launch-temp"
  }
}

data "aws_ami" "amazon-linux-2023" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.9*-x86_6"]
  }

}