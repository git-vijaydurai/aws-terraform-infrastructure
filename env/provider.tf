# Configure the AWS Provider

provider "aws" {
  region = "ap-south-1"

  shared_credentials_files = ["/home/vijaydurai/.aws/credentials"]
}
