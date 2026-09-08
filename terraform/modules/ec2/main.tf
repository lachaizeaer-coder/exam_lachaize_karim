resource "aws_instance" "ec2" {
  ami           = data.aws_ami.available_ami.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = templatefile("${path.root}/install_wordpress.sh", {
    db_host     = var.db_endpoint
    db_name     = var.db_name
    db_user     = var.db_username
    db_password = var.db_password
  })

  tags = {
    Name = "wordpress-ec2"
  }
}


### Security group for applicative layer
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Security group for EC2"
  vpc_id      = var.vpc_id

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

  ingress {
    description = "HTTPS access from internet"
    from_port   = 443
    to_port     = 443
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
