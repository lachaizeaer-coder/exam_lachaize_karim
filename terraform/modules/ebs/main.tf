resource "aws_ebs_volume" "persistent_volume" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  tags = {
    Name = "PersistentVolume"
  }
}