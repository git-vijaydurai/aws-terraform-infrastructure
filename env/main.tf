
module "vpc_module" {

  source            = "../modules/vpc"
  vpc_cidr_in       = var.vpc_cidr
  subnet_01_cidr_in = var.subnet_01_cidr
  subnet_02_cidr_in = var.subnet_02_cidr
  project_tag_in    = var.current_project_tag


}


module "sg_module" {

  source         = "../modules/sg"
  vpc_id_in      = module.vpc_module.vpc_id_out
  project_tag_in = var.current_project_tag



}

module "instance_module" {

  source                = "../modules/public_instance"
  subnet_1_id_in        = module.vpc_module.subnet_1_id_out
  public_instance_sg_in = module.sg_module.public_instance_sg_out
  project_tag_in        = var.current_project_tag
  ami_id_in             = var.amazon_ec2_ami_id


}

