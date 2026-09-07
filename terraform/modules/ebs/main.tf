resource "aws_ebs_volume" "db_pv" {
  availability_zone = data.aws_availability_zones.available.names[0]

  size              = var.volume_size

  lifecycle {
    prevent_destroy    = var.prevent_destroy
  }
  tags = {
    Name = "PersistentVolume"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.db_pv.id
  instance_id = var.instance_id
}