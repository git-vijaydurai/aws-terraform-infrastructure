variable "vpc_cidr" {
  default = "192.168.2.0/24"

}

variable "subnet_01_cidr" {
  default = "192.168.2.0/28"

}

variable "subnet_02_cidr" {
  default = "192.168.2.16/28"
}


variable "current_project_tag" {
  default = ""
}


variable "ubuntu_22_ami_id" {

  default = "ami-0522ab6e1ddcc7055"

}


variable "amazon_ec2_ami_id" {

  default = "ami-08718895af4dfa033"

}
  