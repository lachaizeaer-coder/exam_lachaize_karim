variable "environment" {
    description = "The environment for the resources"
    type        = string
    default     = "dev"
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "subnets_cidr" {
    description = "CIDR blocks for the subnets"
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

