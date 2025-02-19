Notes

1. To apply the Terraform configuration, use the following command with the variable.tfvars file:

terraform apply --auto-approve -var-file="variable.tfvars"


2. Alternatively, you can pass values manually in the following order:


terraform apply --auto-approve \
  -var-file="variable.tfvars" \
  -var="current_project_tag=..." \
  -var="ip_range=..." \
  -var="enter_user_name_based_on_ami=..."


3. User Selection:

You can enter either ec2-user or ubuntu for the enter_user_name_based_on_ami variable.
The system is configured to determine the correct username based on the AMI automatically.


4. Ensure that Terraform is installed and properly configured before running these commands.

Tainting a Module:


If you need to taint a specific module, use the following command:


terraform taint <module_name>

For example:

terraform taint module.instance_module.aws_instance.instance


Important Instructions:


If any of these variables are left empty, Terraform will use the defaults (variable.tf) or prompt for input.


current_project_tag          = "sample"
confirm_dns_update           = "no"         # Keep this as "no" because this configures my own domain
enter_user_name_based_on_ami = "ubuntu"
ip_range                     = "130"
do_you_want_nat_gateway      = false






