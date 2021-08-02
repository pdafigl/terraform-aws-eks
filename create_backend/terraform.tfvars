region              = "eu-west-1"
bucket_name         = "tf-states"
dynamodb_table_name = "terraform-states-lock"
#
user_name   = "tfstate_user"
policy_name = "tfstate_user_policy"

# Tags values
project_name = "CLARKS"
environment  = "DEV"
