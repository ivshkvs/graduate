provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0ec7f9846da6b0f61"
  instance_type = "t2.micro"
  key_name      = "my-key"

  tags = {
    Name = "example-instance"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y docker",
      "sudo service docker start",
      "sudo usermod -a -G docker ubuntu",
      "docker login -u ${var.DOCKER_USERNAME} -p ${var.DOCKER_PASSWORD}",
      "docker pull docker pull ivshkvs/tg_bot:32",
      "docker run -d ivshkvs/tg_bot:32"
    ]
  }
}


