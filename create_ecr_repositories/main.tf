# Create repositories

module "repo_dev" {
  source                 = "./modules/repository"
  repository_name        = var.repository_name_dev
  project_name           = var.project_name
  repository_policy_name = var.repository_policy_name_dev
}


# Create registry policy
module "registry_policy" {
  source               = "./modules/registry_policy"
  registry_policy_name = var.registry_policy_name
  depends_on = [
    module.repo_dev,
  ]
}