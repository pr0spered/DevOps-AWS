# Add website files to S3 bucket
resource "aws_s3_object" "ecomm-frontend" {
  bucket   = aws_s3_bucket.ecomm-bucket.id
  key      = each.value
  for_each = fileset("${path.module}/E-Commerce", "**")
  source   = "${path.module}/E-Commerce/${each.value}"
  etag     = filemd5("${path.module}/E-Commerce/${each.value}")

  tags = {
    Name = "ecomm-bucket-object"
  }

}
