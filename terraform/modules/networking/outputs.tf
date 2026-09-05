output "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  type        = list(string)
  value       = aws_subnet.main[*].id
}