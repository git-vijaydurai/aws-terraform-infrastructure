data "local_file" "dns_entry" {
  filename = "${path.module}/../scripts/dns_entry.sh"
}

locals {
  dns_entry_content = data.local_file.dns_entry.content
}



module "vpc_module" {

  source            = "../modules/vpc"
  vpc_cidr_in       = var.vpc_cidr
  subnet_01_cidr_in = var.subnet_01_cidr
  subnet_02_cidr_in = var.subnet_02_cidr
  project_tag_in    = var.current_project_tag


}


module "sg_module" {

  source           = "../modules/sg"
  vpc_id_in        = module.vpc_module.vpc_id_out
  project_tag_in   = var.current_project_tag
  allowed_ports_in = var.allowed_ports

}

module "instance_module" {

  source                = "../modules/public_instance"
  subnet_1_id_in        = module.vpc_module.subnet_1_id_out
  instance_sg_in        = module.sg_module.instance_sg_out
  project_tag_in        = var.current_project_tag
  instance_type_in      = var.c4_4xlarge_instance_type
  dns_entry_content_in  = local.dns_entry_content
  confirm_dns_update_in = var.confirm_dns_update
  ami_id_in             = var.amazon_ec2_ami_id
  linux_user_in         = var.enter_user_name_based_on_ami

}



# terraform taint module.instance_module.aws_instance.instance
