output "terraform_eks_user_access_key" {
  description = "Return the user access key"
  value       = aws_iam_access_key.terraform_eks_user.id
}

output "terraform_eks_user_secret_key" {
  description = "Return the user secret key"
  value       = aws_iam_access_key.terraform_eks_user_access_key.secret
}