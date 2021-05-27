provider "aws" {
  region                  = "ap-south-1"
  profile                 = "default"
}


resource "aws_instance" "webos1" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  security_groups = [ "os-4" ]
  key_name = "gautamsethi"

  tags = {
    Name = "web server"
  }
}

resource "aws_ebs_volume" "server_store" {
  availability_zone = aws_instance.webos1.availability_zone
  size              = 10

  tags = {
    Name = "storage"
  }
}

resource "aws_volume_attachment" "Volume_Attached" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.server_store.id
  instance_id = aws_instance.webos1.id
}

  

resource "null_resource"  "nullre1"{


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/User/Downloads/gautamsethi.pem")
    host     =  aws_instance.webos1.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo yum install php -y",
      "sudo systemctl start httpd"
    ]
  }
}

resource "null_resource"  "nullre2"{


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/User/Downloads/gautamsethi.pem")
    host     =  aws_instance.webos1.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkfs.ext4  /dev/xvdh",
      "sudo mount  /dev/xvdh  /var/www/html",
      "sudo yum install git -y",
      "sudo git clone https://github.com/abd8126/PHP-Starting.git  /var/www/html/web"
    ]
  }
}

resource "null_resource"  "nullre3"{


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/User/Downloads/gautamsethi.pem")
    host     =  aws_instance.webos1.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "sudo git clone https://github.com/abd8126/PHP-Starting.git  /var/www/html/web"
    ]
  }
}


resource "null_resource"  "nullre4"{


  
  provisioner "local-exec" {
    command ="chrome http://13.233.144.88/web/Lecture%2015.php"
  }
}
