# data to fetch Route 53 hosted zone information
data "aws_route53_zone" "ecomm-zone" {
  name         = "strawb3rry.club"
  private_zone = false
}

# Create Route 53 DNS record to point to Load Balancer
resource "aws_route53_record" "ecomm-record" {
  zone_id = data.aws_route53_zone.ecomm-zone.zone_id
  name    = "www.strawb3rry.club"
  type    = "A"

  alias {
    name                   = aws_lb.ecomm-alb-fe.dns_name
    zone_id                = aws_lb.ecomm-alb-fe.zone_id
    evaluate_target_health = true
  }
}