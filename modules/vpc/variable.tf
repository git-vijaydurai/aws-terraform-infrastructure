variable "vpc_cidr_in" {}
variable "subnet_01_cidr_in" {}
variable "subnet_02_cidr_in" {}
variable "project_tag_in" {}

variable "vpc_tag" {
  type    = string
  default = "vpc"
}


variable "subnet_01_tag" {
  type    = string
  default = "subnet-01"
}

variable "subnet_02_tag" {
  type    = string
  default = "subnet-02"
}

variable "az_zone_a" {
  type    = string
  default = "ap-south-1a"
}

variable "az_zone_b" {
  type    = string
  default = "ap-south-1b"
}

variable "igw_tag" {
  type    = string
  default = "igw"
}

variable "cidr_open" {
  default = "0.0.0.0/0"
}

variable "public_routetable_tag" {
  type    = string
  default = "public_route_table"

}

variable "private_routetable_tag" {
  type    = string
  default = "private_route_table"

}




