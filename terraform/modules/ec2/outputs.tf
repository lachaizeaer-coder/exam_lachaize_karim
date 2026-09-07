output "availability_zone" {
    description = "The availability zone of the EC2 instance"
    value       = aws_instance.ec2.availability_zone
}

output "security_group_id" {
    description = "The security group ID of the EC2 instance"
    value       = aws_security_group.ec2_sg.id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2.id
}

output "ami_id" {
  description = "The AMI ID of the EC2 instance"
  value       = aws_instance.ec2.ami
}

variable "db_endpoint" {
  description = "The endpoint of the RDS database"
  type        = string
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true
}