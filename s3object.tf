# Add website files to S3 bucket
resource "aws_s3_object" "ecomm-frontend" {
  bucket   = aws_s3_bucket.ecomm-bucket.id
  key      = each.value
  for_each = fileset(local.e_commerce_path, "**")
  source   = "${local.e_commerce_path}/${each.value}"
  etag     = filemd5("${local.e_commerce_path}/${each.value}")

  tags = {
    Name = "ecomm-bucket-object"
  }

}

# Local variable for the website file path
locals {
  e_commerce_path = "d:/Cloud Engineer/DevOps-AWS/E-Commerce"
}
