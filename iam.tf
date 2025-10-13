# IAM Role for EC2 instances
resource "aws_iam_role" "ecomm-role" {
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "ecomm-role"
  }
}

# Attatch IAM policy to the role
resource "aws_iam_role_policy_attachment" "ecomm-role-attach" {
  role       = aws_iam_role.ecomm-role.name
  policy_arn = aws_iam_policy.ecomm-iam-policy.arn
}