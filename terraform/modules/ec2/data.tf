data "aws_ami" "available_ami" {
    most_recent = true
    owners      = ["amazon"]

    filter {
        name   = "instance-type-specification.supported-instance-type"
        values = [var.instance_type]
    }
}