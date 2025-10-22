# S3 Bucket to store website code
resource "aws_s3_bucket" "ecomm-bucket" {

  tags = {
    Name = "ecomm-bucket"
  }
}