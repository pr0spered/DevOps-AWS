# data to find most recent Amazon Linux 2023 AMI
data "aws_ami" "amazon-linux-2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.9*-x86_64"]
  }

}

# # data to fetch Route 53 hosted zone information
# data "aws_route53_zone" "ecomm-zone" {
#   name         = "<hosted-zone>" # Replace with your hosted zone name
#   private_zone = false
# }

# data to fetch public IPv4 address of user
data "http" "my_ip" {
  url = "https://ipv4.icanhazip.com"
}