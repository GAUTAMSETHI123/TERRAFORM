resource "null_resource"  "nullre1"{


depends_on = [
      aws_volume_attachment.Volume_Attached
]


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
      "sudo systemctl start httpd",
      "sudo mkfs.ext4 /dev/xvdh",
      "sudo mount /dev/xvdh /var/www/html",
      "sudo yum install git -y",
      "sudo git clone https://github.com/abd8126/PHP-Starting.git  /var/www/html/web",
    ]
  }
}