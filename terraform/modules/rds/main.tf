resource "aws_db_instance" "rds" {
  identifier           = "primary-db"

  engine               = var.database_engine
  engine_version       = var.database_engine_version

  instance_class       = var.instance_type

  allocated_storage    = var.storage_capacity

  availability_zone    = data.aws_availability_zones.available.names[0]

  db_name              = var.database_name
  username             = security.username
  password             = security.password

  parameter_group_name = "default.mysql8.0"

  skip_final_snapshot  = true
  backup_retention_period = 7

  multi_az             = var.is_multi_az
  tags = {
    Name = "wordpress-db"
  }
}

resource "aws_db_instance" "rds_relica" {
  identifier           = "replica-db"

  replicate_source_db   = aws_db_instance.rds.id

  instance_class        = var.instance_type

  availability_zone     = data.aws_availability_zones.available.names[1]

  skip_final_snapshot  = true

}


### Security group for database layer
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Security group for RDS"
  vpc_id      = aws_vpc.vpc.id
}


resource "aws_security_group_rule" "rds_sg_inbound_rule" {
  description = "Allow inbound traffic from EC2 instances"
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.rds_sg.id
  source_security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "rds_sg_outbound_rule" {
  description = "Allow all outbound traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.rds_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}