# Provider configuration
# You can provide de access key and the secret kye with aws cli configure,
# or create environment variables TF_VAR_access_key and TF_VAR_secret_key
provider "aws" {
  region = var.region
}