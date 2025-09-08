resource "aws_instance" "web" {
  ami                         = var.amiID[var.region]
  instance_type               = "t3.micro"
  key_name                    = "StackOps-Cluster-Key"
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.K8-s_cluster.id]

  tags = {
    Name    = "StackOps-Web-Instance"
    Project = "StackOps"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "file" {
    source      = "credentials"
    destination = "/tmp/credentials"
  }
  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file("StackOps-1.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }

}

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}
