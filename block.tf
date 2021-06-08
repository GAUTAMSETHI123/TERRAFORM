resource "aws_ebs_volume" "server_store" {
  availability_zone = aws_instance.webos1.availability_zone
  size              = 10

  tags = {
    Name = "storage"
  }
}