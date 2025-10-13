# S3 Bucket to store frontend and backend code
resource "aws_s3_bucket" "ecomm-bucket" {

  tags = {
    Name        = "ecomm-bucket"
  }
}