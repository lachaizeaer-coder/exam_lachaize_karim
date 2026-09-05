variable "username" {
    description = "The username for the database"
    type        = string
    default     = "admin"
    sensitive   = true
}

variable "password" {
    description = "The password for the database"
    type        = string
    sensitive   = true
}
