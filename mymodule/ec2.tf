resource "aws_key_pair" "deployer" {
  key_name   = "${var.my_env}-env-key"
  public_key = file("/Users/apple/multienv/mymodule/env-key.pub")
  
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "allow_user_to_connect" {
  name        = "${var.my_env}-allow-TLS"
  description = "Allow user to connect"
  vpc_id      = aws_default_vpc.default.id
  ingress {
    description = "port 22 allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = " allow all outgoing traffic "
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 80 allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 443 allow"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.my_env}-mysecurity"
  }
}

resource "aws_instance" "my_app_server" {
    count = var.public_instance_count
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.public.id
    key_name        = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.allow_user_to_connect.name]
  root_block_device {
    volume_size = 10 
    volume_type = "gp3"
  }
    tags = {
        Name = "${var.my_env}-public-instance-${count.index + 1}"
    }
}


resource "aws_instance" "private_instance" {
  count                      = var.private_instance_count
  ami                        = "ami-0c94855ba95c71c99"  # Example AMI
  instance_type              = "t3.micro"
  subnet_id                  = aws_subnet.private.id
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = "${var.my_env}-private-instance-${count.index + 1}"
  }
}