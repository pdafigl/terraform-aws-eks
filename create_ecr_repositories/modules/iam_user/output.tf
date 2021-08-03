output "terraform_iam_user_access_key" {
  description = "Return the user access key"
  value       = aws_iam_access_key.terraform_iam_user_access_key.id
  sensitive   = true
}

output "terraform_iam_user_secret_key" {
  description = "Return the user secret key"
  value       = aws_iam_access_key.terraform_iam_user_access_key.secret
  sensitive   = true
}