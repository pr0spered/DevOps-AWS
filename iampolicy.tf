# IAM policy for EC2 instances to access S3 bucket
resource "aws_iam_policy" "ecomm-iam-policy" {
  name        = "ecomm-iam-policy"
  description = "IAM policy for EC2 to access S3 bucket and SSM"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        "Resource" : "*"
      }
    ]
  })

  tags = {
    Name = "ecomm-iam-policy"
  }
}