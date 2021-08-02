
# Region to deploy infrastructure
variable "region" {
  type    = string
  default = "eu-west-1"
}

# Variables for IAM role and user Definition
variable "eks_user_name" {
  type = string

}
variable "eks_policy_name" {
  type = string
}

# Tags values
variable "project_name" {
  type = string
}
