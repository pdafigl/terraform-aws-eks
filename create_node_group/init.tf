# AWS provider configuration
provider "aws" {
  region  = data.terraform_remote_state.eks.outputs.region
  profile = "eks"
}

# Backend configuration. Creates or uses a S3 object to stores the terraform state
terraform {
  backend "s3" {
    region         = "eu-west-1"
    bucket         = "tf-states-clarks"
    key            = "group_node-00"
    max_retries    = 5
    dynamodb_table = "terraform-states-lock"
    encrypt        = true
    profile        = "tfstate"
  }
}

# Creates a datasource with terraform state of EKS creation
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket  = "tf-states-clarks"
    key     = "eks"
    region  = "eu-west-1"
    profile = "tfstate"
  }
}