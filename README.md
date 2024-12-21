Setting Up a New Configuration or Using Existing Values


To create a new setup or use the already defined values, follow these steps:

1. Clone the Repository

Clone this repository and navigate to the env folder.

2. Edit the provider.tf File

Open the provider.tf file. Provide your AWS credentials as shown below:

provider "aws" {
  region     = "------"   # Set your AWS region here
  access_key = "------"   # Set your AWS access key here
  secret_key = "------"   # Set your AWS secret key here
}


3. Edit the variable.tf File

Next, edit the variable.tf file. Set the values according to your requirements, or leave them as they are if they’re already configured correctly:


variable "vpc_cidr" {
  default = "-.-.-.-/-"   # Define your VPC CIDR block
}

variable "subnet_01_cidr" {
  default = "-.-.-.-/-"   # Define CIDR block for Subnet 01
}

variable "subnet_02_cidr" {
  default = "-.-.-.-/-"   # Define CIDR block for Subnet 02
}

variable "current_project_tag" {
  default = "------"      # Define your project tag
}

variable "ubuntu_22_ami_id" {
  default = "------"      # Define the Ubuntu 22.04 AMI ID
}

variable "amazon_ec2_ami_id" {
  default = "------"      # Define the Amazon EC2 AMI ID
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

Note: 

Leave the existing values if they are already set correctly for your setup.

or

Replace the existing values with the appropriate information for your project.

