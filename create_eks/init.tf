# Provider configuration
provider "aws" {
  region  = data.terraform_remote_state.backend.outputs.region
  profile = "eks"
}

# Backend configuration. Creates or uses a S3 object to stores the terraform state
terraform {
  backend "s3" {
    region         = "eu-west-1"
    bucket         = "tf-states-clarks"
    key            = "eks"
    max_retries    = 5
    dynamodb_table = "terraform-states-lock"
    encrypt        = true
    profile        = "tfstate"
  }
}

# Creates a datasource with terraform state of Users creation
data "terraform_remote_state" "backend" {
  backend = "s3"
  config = {
    bucket  = "tf-states-clarks"
    key     = "users"
    region  = "eu-west-1"
    profile = "tfstate"
  }
}

# Creates local variable with EKS cluster name
resource "random_string" "suffix" {
  length  = 8
  special = false
}


locals {
  cluster_name = "${var.project_name}-eks-${random_string.suffix.result}"
}