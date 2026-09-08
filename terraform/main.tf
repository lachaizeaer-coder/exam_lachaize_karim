module "networking" {
  source            = "./modules/networking"
  
}

module "ec2" {
  source            = "./modules/ec2"

  vpc_id            = module.networking.vpc_id
  subnet_id         = module.networking.public_subnets[0]

  db_endpoint       = module.rds.db_endpoint
  db_name           = module.rds.db_name
  db_username       = module.rds.db_username
  db_password       = module.rds.db_password
}

module "ebs" {
  source            = "./modules/ebs"

  availability_zone = module.ec2.availability_zone
  volume_size       = 10
  device_name       = "/dev/sdh"
  instance_id       = module.ec2.instance_id
}

module "rds" {
  source                = "./modules/rds"

  subnet_ids            = module.networking.private_subnets

  vpc_id                = module.networking.vpc_id
  ec2_security_group_id = module.ec2.security_group_id
}

