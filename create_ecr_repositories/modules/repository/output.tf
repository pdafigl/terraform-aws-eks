output "terraform_ecr_repository_arn" {
  description = "Return the arn of the repository"
  value       = aws_ecr_repository.ecr_repository.arn
}

output "terraform_ecr_repository_id" {
  description = "Return the Registry ID of the repository"
  value       = aws_ecr_repository.ecr_repository.registry_id
}

output "terraform_ecr_repository_url" {
  description = "Return the URL of the repository"
  value       = aws_ecr_repository.ecr_repository.repository_url
}