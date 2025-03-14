variable "ami_id_in" {}
variable "instance_type_in" {}
variable "subnet_1_id_in" {}
variable "instance_sg_in" {}
variable "project_tag_in" {}
variable "confirm_dns_update_in" {}
variable "linux_user_in" {}


variable "dns_entry_content_in" {
  type = string
}

variable "instance_tag" {
  type    = string
  default = ""
}

variable "instance_key_name_in" {}

variable "associate_public_ip_address" {
  default = "true"
}

variable "instance_root_volume_size_in" {
  
}



