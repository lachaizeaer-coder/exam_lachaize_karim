variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t3.micro"
}

variable "vpc_id" {
  description = "ID du VPC transmis depuis le module networking"
  type        = string
}

variable "subnet_id" {
  description = "ID du subnet public pour l'instance EC2"
  type        = string
}
