output "availability_zones" {
    description = "The availability zones of the EC2 instances"
    value       = aws_instance.web.availability_zone
}

output "security_group_id" {
    description = "The security group IDs of the EC2 instances"
    value       = aws_security_group.ec2.id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2.id
}

output "ami_id" {
  description = "The AMI ID of the EC2 instance"
  value       = aws_instance.ec2.ami
}