output "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  type        = list(string)
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  type        = list(string)
  value       = aws_subnet.private[*].id
}