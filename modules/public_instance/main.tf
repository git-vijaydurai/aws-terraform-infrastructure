#Public_ec2_info

resource "aws_instance" "public_instance" {


  ami                         = var.ami_id_in
  subnet_id                   = var.subnet_1_id_in
  instance_type               = var.instance_type_t2_medium
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [var.public_instance_sg_in]


  tags = {
    Name = "${var.project_tag_in}-${var.public_instance_tag}"
  }
  

}





