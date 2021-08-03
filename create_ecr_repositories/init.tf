# Provider configuration
# You can provide de access key and the secret kye with aws cli configure,
# or create environment variables TF_VAR_access_key and TF_VAR_secret_key
provider "aws" {
  region  = data.terraform_remote_state.backend.outputs.region
  profile = "default"
}

# Backend configuration. Creates or uses a S3 object to stores the terraform state
terraform {
  backend "s3" {
    region         = "eu-west-1"
    bucket         = "tf-states-clarks"
    key            = "users"
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