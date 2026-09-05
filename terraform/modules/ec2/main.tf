resource "aws_instance" "ec2" {
  ami           = data.aws_ami.available_ami.id
  instance_type = var.instance_type
  availability_zone = data.aws_availability_zones.available.names[0]
}