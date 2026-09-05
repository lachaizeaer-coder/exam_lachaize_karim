variable "volume_size" {
  description = "The EBS volume capacity (GiB)"
  type        = number
  default     = 10
}


variable "availability_zone" {
  type        = string
  description = "Subnet IDs passed from the VPC module"
}