variable "volume_size" {
  description = "The EBS volume capacity (GiB)"
  type        = number
  default     = 10
}

variable "prevent_destroy" {
  description = "Whether to prevent the EBS volume from being destroyed"
  type        = bool
  default     = false #For the resources management in the exam context, otherwise set to true
}