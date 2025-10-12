# Bastion Host
resource "aws_instance" "ecomm-bastion" {
  ami                         = data.aws_ami.amazon-linux-2023.image_id
  instance_type               = "t2.micro"
  key_name                    = "sing_01"
  vpc_security_group_ids      = [aws_security_group.ecomm-sec-bh.id]
  subnet_id                   = aws_subnet.ecomm-fe-sub-az1.id
  associate_public_ip_address = true

  tags = {
    Name = "ecomm-bastion-host"
  }
}