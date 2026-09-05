variable "volume size" {
  description = "The EBS volume capacity (GiB)"
  type        = number
  default     = 10
}

variable "availability zone" {
  description = "The availability zone in which to create the EBS volume"
  type        = list(string)
}