resource "aws_instance" "ec2" {
  ami           = data.aws_ami.available_ami.id
  instance_type = var.instance_type
  availability_zone = data.aws_availability_zones.available.names[0]

  user_data = templatefile("${path.module}/install_wordpress.sh", {
    db_endpoint = module.rds.db_endpoint
    db_name     = module.rds.db_name
    db_username = module.rds.db_username
    db_password = module.rds.db_password
  })

  tags = {
    Name = "wordpress-ec2"
  }

}