data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "bot" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.server_size
  vpc_security_group_ids = [aws_security_group.bot.id]
  user_data	= file("docker.sh")

  tags = {
    Name  = "${var.server_name}server000"
    Owner = "Saveli Ivashkov"
  }
}

resource "aws_default_vpc" "default" {} 

resource "aws_security_group" "bot" {
  name_prefix = "${var.server_name}security_group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.server_name}security_group"
    Owner = "Saveli Ivashkov"
  }
}

resource "aws_eip" "bot" {
  vpc      = true
  instance = aws_instance.bot.id
  tags = {
    Name  = "${var.server_name}ip"
    Owner = "Saveli Ivashkov"
  }
}
