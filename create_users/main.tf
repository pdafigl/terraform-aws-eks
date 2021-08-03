# Create iam policy and user for work with Terraform to create EKS cluster
module "user_policy" {
  source       = "./modules/eks_user"
  user_name    = var.eks_user_name
  policy_name  = var.eks_policy_name
  project_name = var.project_name
}

module "ecr_user" {
  source       = "./modules/iam_user"
  user_name    = var.ecr_user_name
  project_name = var.project_name
}