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
          "s3:Get*",
          "s3:List*",
          "s3:Describe*",
          "s3-object-lambda:Get*",
          "s3-object-lambda:List*"
        ],
        "Resource" : "*"
      }
    ]
  })

  tags = {
    Name = "ecomm-iam-policy"
  }
}