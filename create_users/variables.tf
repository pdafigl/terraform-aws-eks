
# Region to deploy infrastructure
variable "region" {
  type    = string
  default = "eu-west-1"
}

# Bucket name
variable "bucket_name" {
  type = string
}

# Variables for IAM role and user Definition
variable "user_name" {
  type = string

}

variable "policy_name" {
  type = string
}
