# Bastion Host
resource "aws_instance" "ecomm-bastion" {
  ami                         = data.aws_ami.amazon-linux-2023.image_id
  instance_type               = "t2.micro"
  key_name                    = "sing_01"
  vpc_security_group_ids      = [aws_security_group.ecomm-sec-bh.id]
  subnet_id                   = aws_subnet.ecomm-fe-sub-az1.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ecomm-instance-profile.name
  user_data = base64encode(templatefile("${path.module}/scripts/bastion.sh", {
    db_endpoint = aws_db_instance.ecomm-db-inst.address,
    s3_bucket   = aws_s3_bucket.ecomm-bucket.id
  }))

  tags = {
    Name = "ecomm-bastion-host"
  }
}