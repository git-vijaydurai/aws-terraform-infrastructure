variable "ami_id_in" {}


variable "instance_type_t2_micro" {

  default = "t2.micro"

}


variable "instance_type_t2_medium" {

  default = "t2.medium"

}



variable "key_name" {

  default = "pri_mum"

}



variable "associate_public_ip_address" {

  default = "true"

}



variable "public_instance_tag" {

  type    = string
  default = "public"

}


variable "public_instance_private_ip" {

  type    = string
  default = "192.168.2.12"

}

variable "subnet_1_id_in" {}
variable "public_instance_sg_in" {}
variable "project_tag_in" {}