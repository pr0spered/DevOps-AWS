# VPC where the e-commerce site is hosted
resource "aws_vpc" "e-comm" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "ecomm-vpc"
  }
}