output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}
output "WebPublicIP" {
  description = "AMI ID of Ubuntu instance"
  value       = aws_instance.web.public_ip
}

output "WebPrivateIP" {
  description = "AMI ID of Ubuntu instance"
  value       = aws_instance.web.private_ip
}
output "Web_Dns_hostname" {
  description = "DNS hostname of the web instance"
  value       = aws_instance.web.public_dns
}
