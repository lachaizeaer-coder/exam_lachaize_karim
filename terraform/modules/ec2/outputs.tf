output "ec2_az_set" {
    description = "The availability zones of the EC2 instances"
    value       = toset(aws_instance.ec2.*.availability_zone)
}