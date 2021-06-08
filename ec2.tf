resource "aws_instance" "webos1" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  security_groups = [ "os-4" ]
  key_name = "gautamsethi"

  tags = {
    Name = "web server"
  }
}