variable "aws_region" {
    description = "AWS region to deploy resources"
    type = string
    default = "eu-west-3"
}

variable "aws_access_key" {
    description = "AWS access key"
    type = string
    default = "AKIAR22IPVNI5FWLXXXR"
    sensitive = true
}

variable "aws_secret_key" {
    description = "AWS secret key"
    type = string
    default = "k/+rrQwCaGG5ZKT55QRvfoF8XEuuCtJlvd9IxnNK"
    sensitive = true
}

