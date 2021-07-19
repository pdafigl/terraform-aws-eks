# Create iam policy and user for work with Terraform to create EKS cluster
module "user_policy" {
  source              = "./modules/eks_user"
  user_name           = var.user_name
  policy_name         = var.policy_name
  bucket_arn          = module.bucket.bucket_arn
  dynamodb_table_name = var.dynamodb_table_name
}