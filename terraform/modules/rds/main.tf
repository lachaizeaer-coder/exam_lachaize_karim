resource "aws_db_instance" "rds" {
  allocated_storage    = var.storage_capacity
  engine               = var.database_engine
  engine_version       = var.database_engine_version
  instance_class       = var.instance_type
  db_name              = var.database_name
  username             = security.username
  password             = security.password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  multi_az             = var.is_multi_az
  tags = {
    Name = "wordpress-db"
  }
}