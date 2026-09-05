variable "database_engine" {
    description = "The database engine"
    type        = string
    default     = "mysql"
}

variable "database_name" {
    description = "The databse name"
    type        = string
    default     = "wordpress-db"
}

variable "is_multi_az" {
    description = "Set if the db can run in multiple Availability Zone"
    type        = boolean
    default     = true
}

variable "storage_capacity" {
    description = "Allocated storage"
    type        = number
    default     = 5
}

vatiable "instance_type" {
    description = "Class of instance in use"
    type        = string
    default     = "db.t3.micro"
}