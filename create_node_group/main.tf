
module "node00" {
  source                    = "./modules/node_group"
  cluster_name              = data.terraform_remote_state.eks.outputs.cluster_name
  node_group_name           = var.node_group_name
  node_role_arn             = data.terraform_remote_state.eks.outputs.worker_iam_role_arn
  subnet_ids                = data.terraform_remote_state.eks.outputs.public_subnet_ids
  instance_types            = var.instance_types
  labels                    = var.labels
  desired_size              = var.desired_size
  max_size                  = var.max_size
  min_size                  = var.min_size
  source_security_group_ids = [data.terraform_remote_state.eks.outputs.management_security_group]
  ssh_key                   = var.ssh_key
}


module "node01" {
  source                    = "./modules/node_group"
  cluster_name              = data.terraform_remote_state.eks.outputs.cluster_name
  node_group_name           = "node_group_01"
  node_role_arn             = data.terraform_remote_state.eks.outputs.worker_iam_role_arn
  subnet_ids                = data.terraform_remote_state.eks.outputs.private_subnet_ids
  instance_types            = var.instance_types
  labels                    = var.labels
  desired_size              = var.desired_size
  max_size                  = var.max_size
  min_size                  = var.min_size
  source_security_group_ids = [data.terraform_remote_state.eks.outputs.management_security_group]
  ssh_key                   = var.ssh_key
}
