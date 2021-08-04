output "terraform_ecr_repository_dev_arn" {
  description = "Return the arn of the repository"
  value       = module.repo_dev.terraform_ecr_repository_arn
}

output "terraform_ecr_repository_dev_id" {
  description = "Return the registry ID of the repository"
  value       = module.repo_dev.terraform_ecr_repository_id
}

output "terraform_ecr_repository_dev_url" {
  description = "Return the repository URL of the repository"
  value       = module.repo_dev.terraform_ecr_repository_url
}
