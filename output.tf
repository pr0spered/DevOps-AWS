# Display RDS endpoint
output "rds_endpoint" {
  value       = aws_db_instance.ecomm-db-inst.address
  description = "The address of the RDS instance"
}

# Display Load Balancer DNS
output "lb_dns" {
  value       = aws_lb.ecomm-alb-fe.dns_name
  description = "The DNS of the Load Balancer"
}

# Display Route 53 record name
output "custom_dns" {
  value       = aws_route53_record.ecomm-record.name
  description = "The DNS name for the Route 53 record"
}

# Display user's ipv4 address
output "my_ip" {
  value       = data.http.my_ip.response_body
  description = "The public IPv4 address of the user"
}