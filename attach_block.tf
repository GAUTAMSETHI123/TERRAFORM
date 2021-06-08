resource "aws_volume_attachment" "Volume_Attached" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.server_store.id
  instance_id = aws_instance.webos1.id
}