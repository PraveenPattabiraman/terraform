resource "null_resource" "name" {
    depends_on = [ module.ec2_public ]
    connection {
    type     = "ssh"
    host     = aws_eip.my_eip.public_ip
    user     = "ec2-user"
    password = ""
    private_key = file("private-key/devops.pem")
    
  }

    provisioner "file" {
    source      = "private-key/devops.pem"
    destination = "/tmp/private-key.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/private-key.pem"
    ]
  }

  provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    #on_failure = continue
  }

  
}


