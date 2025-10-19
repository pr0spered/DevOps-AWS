# data to fetch Route 53 hosted zone information
data "aws_route53_zone" "ecomm-zone" {
  name         = "strawb3rry.club"
  private_zone = false
}