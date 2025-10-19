# Display RDS endpoint
output "rds_endpoint" {
  value       = aws_db_instance.ecomm-db-inst.endpoint
  description = "The endpoint of the RDS instance"
}

# Display Load Balancer DNS
output "lb_dns" {
  value       = aws_lb.ecomm-alb-fe.dns_name
  description = "The DNS of the Load Balancer"
}

output "custom_dns" {
  value       = aws_route53_record.ecomm-record.name
  description = "The DNS name for the Route 53 record"
}