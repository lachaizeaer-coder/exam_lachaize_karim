resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "wordpress-vpc"
  }
}

resource "aws_subnet" "subnet-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  region                  = data.aws_region.current.name
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "wordpress-subnet-a"
  }
}

resource "aws_subnet" "subnet-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  region                  = data.aws_region.current.name
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "wordpress-subnet-b"
  }
}