variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t3.micro"
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type        = string
}

variable "availability_zone" {
    description = "The availability zone in which to create the EC2 instance"
    type        = string
}