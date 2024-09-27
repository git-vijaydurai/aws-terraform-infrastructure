resource "aws_security_group" "public_instance_sg" {

  name        = "${var.project_tag_in}-${var.public_instance_sg_tag}"
  vpc_id      = var.vpc_id_in
  description = "public_ec2_security_group"

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 443
    to_port     = 443
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

    Name = "${var.project_tag_in}-${var.public_instance_sg_tag}"
  }
}

