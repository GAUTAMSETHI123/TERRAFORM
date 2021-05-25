provider "aws" {

region = "ap-south-1"
profile = "default"

}

#STEP-1
resource "aws_instance"  "os1"{

ami = "ami-010aff33ed5991201"
instance_type = "t2.micro"
tags = {
    Name = "gautam"
     }
}

output  "My_public_ip_is"{

value = aws_instance.os1.public_ip
}


output  "My_Availaibility_zone"{
value = aws_instance.os1.availability_zone
}


#STEP-2
resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 10

  tags = {
    Name = "HelloWorld"
  }
}

output "o2"{
value = aws_ebs_volume.example.id
}


#STEP-3
resource "aws_volume_attachment" "Volume_Attached" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.os1.id
}




