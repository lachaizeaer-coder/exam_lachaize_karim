output "ec2_az_set" {
    description = "The availability zones of the EC2 instances"
    value       = toset(aws_instance.ec2.*.availability_zone)
}

output "ec2_security_group_id" {
    description = "The security group IDs of the EC2 instances"
    value       = aws_instance.ec2.*.security_groups
}