variable "vpc_cidr" {
  default = "192.168.-.0/24"

}

variable "subnet_01_cidr" {
  default = "192.168.-.0/28"

}

variable "subnet_02_cidr" {
  default = "192.168.-.16/28"
}


variable "current_project_tag" {
  default = "-"
}


variable "ubuntu_ec2_ami_id" {

  default = "ami-0522ab6e1ddcc7055"

}


variable "amazon_ec2_ami_id" {

  default = "ami-08718895af4dfa033"

}

variable "t2_micro_instance_type" {

  default = "t2.micro"

}


variable "t2_medium_instance_type" {

  default = "t2.medium"

}


variable "t3_small_instance_type" {

  default = "t3.small"

}


variable "allowed_ports" {
  description = "List of ports to allow"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "confirm_dns_update" {

  description = "Give  'yes or no' to run DNS update or Not"
  default     = "no"
}


variable "enter_user_name_based_on_ami" {

  
}