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


### Security group for applicative layer
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Security group for EC2"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP access from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}