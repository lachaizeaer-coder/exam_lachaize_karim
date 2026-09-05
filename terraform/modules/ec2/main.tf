resource "aws_instance" "ec2" {
  ami           = data.aws_ami.available_ami.id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
}