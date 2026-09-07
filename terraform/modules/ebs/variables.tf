variable "volume_size" {
  description = "The EBS volume capacity (GiB)"
  type        = number
}

variable "device_name" {
  description = "The device name"
  type        = string
}

variable "instance_id" {
  description = "The ID of the EC2 instance to attach the EBS volume to"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone where the EBS volume will be created"
  type        = string
}