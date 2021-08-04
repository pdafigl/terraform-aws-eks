output "terraform_eks_user_access_key" {
  description = "Return the user access key"
  value       = aws_iam_access_key.terraform_eks_user_access_key.id
  sensitive   = true
}

output "terraform_eks_user_secret_key" {
  description = "Return the user secret key"
  value       = aws_iam_access_key.terraform_eks_user_access_key.secret
  sensitive   = true
}

output "terraform_eks_user_name" {
  description = "Return the user name"
  value       = aws_iam_user.terraform_eks_user.name
  sensitive   = true
}