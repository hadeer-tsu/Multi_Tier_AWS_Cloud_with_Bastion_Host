module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  vpc_name   = "my-vpc-Terraform"
}

resource "null_resource" "public_instance_provisioners" {

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.key)
    host        = aws_instance.instance[count.index].public_ip
  }

  provisioner "file" {
   
    source      = "./key-pair.pem"
    destination = "/home/ubuntu/key-pair.pem"
    
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ubuntu/key-pair.pem"  # Ensure correct permissions
    ]
  }
    depends_on = [aws_instance.instance]

  }