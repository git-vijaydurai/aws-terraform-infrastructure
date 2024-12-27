data "local_file" "dns_entry" {
  filename = "${path.module}/../scripts/dns_entry.sh"
}

locals {
  dns_entry_content = data.local_file.dns_entry.content
}

#Enter Project Name

locals {
  current_project_tag = var.current_project_tag
}


#We can not pass the variable into the variable block so, I have used local block instead of variable block.

locals {
  vpc_cidr       = "192.168.${var.ip_range}.0/24"
  subnet_01_cidr = "192.168.${var.ip_range}.0/28"
  subnet_02_cidr = "192.168.${var.ip_range}.16/28"
}


module "vpc_module" {

  source            = "../modules/vpc"
  vpc_cidr_in       = local.vpc_cidr
  subnet_01_cidr_in = local.subnet_01_cidr
  subnet_02_cidr_in = local.subnet_02_cidr
  project_tag_in    = local.current_project_tag


}


module "sg_module" {

  source           = "../modules/sg"
  vpc_id_in        = module.vpc_module.vpc_id_out
  project_tag_in   = local.current_project_tag
  allowed_ports_in = var.allowed_ports

}


module "instance_module" {

  source                = "../modules/public_instance"
  subnet_1_id_in        = module.vpc_module.subnet_1_id_out
  instance_sg_in        = module.sg_module.instance_sg_out
  project_tag_in        = local.current_project_tag
  instance_type_in      = var.c4_4xlarge_instance_type
  dns_entry_content_in  = local.dns_entry_content
  confirm_dns_update_in = var.confirm_dns_update
  ami_id_in             = var.ec2_ami_ids["${var.enter_user_name_based_on_ami}"]
  linux_user_in         = var.enter_user_name_based_on_ami

}



# terraform taint module.instance_module.aws_instance.instance
# terraform destroy --auto-approve -var-file="variable.tfvars" -var="current_project_tag=ohio" -var="ip_range=122" -var="enter_user_name_based_on_ami=ec2-user"