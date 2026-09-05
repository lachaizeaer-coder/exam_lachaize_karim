resource "aws_ebs_volume" "persistent_volume" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = var.volume_size
  tags = {
    Name = "PersistentVolume"
  }
}