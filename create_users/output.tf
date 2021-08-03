output "terraform_eks_user_access_key" {
  description = "Show the access_key to use the bucket"
  value       = module.user_policy.terraform_eks_user_access_key
  sensitive   = true
}

output "terraform_eks_user_secret_key" {
  description = "Show the secret_key to use the bucket"
  value       = module.user_policy.terraform_eks_user_secret_key
  sensitive   = true
}

output "terraform_ecr_user_access_key" {
  description = "Show the access_key to use the bucket"
  value       = module.ecr_user.terraform_iam_user_access_key
  sensitive   = true
}

output "terraform_ecr_user_secret_key" {
  description = "Show the secret_key to use the bucket"
  value       = module.ecr_user.terraform_iam_user_secret_key
  sensitive   = true
}