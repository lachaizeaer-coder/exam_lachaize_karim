data "aws_ami_ids" "ubuntu" {
    most_recent = true
    owners      = ["amazon"]

    filter {
        name   = "instance-type-specification.supported-instance-type"
        values = [var.instance_type]
    }
}