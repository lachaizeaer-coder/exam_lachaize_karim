variable "database_engine" {
    description = "The database engine"
    type        = string
    default     = "mysql"
}

variable "database_engine_version" {
    description = "The database engine"
    type        = string
    default     = "8.0"
}

variable "database_name" {
    description = "The databse name"
    type        = string
    default     = "wordpress-db"
}

variable "is_multi_az" {
    description = "Set if the db can run in multiple Availability Zone"
    type        = bool
    default     = true
}

variable "storage_capacity" {
    description = "Allocated storage"
    type        = number
    default     = 10
}

variable "instance_type" {
    description = "Class of instance in use"
    type        = string
    default     = "db.t3.micro"
}

variable "ec2_security_group_id" {
    description = "The security group ID for the EC2 instance"
    type        = string
}

variable "vpc_id" {
    description = "The VPC ID"
    type        = string
}

variable "database_subnet_ids" {
    description = "The subnet IDs for the RDS instance"
    type        = list(string)
}