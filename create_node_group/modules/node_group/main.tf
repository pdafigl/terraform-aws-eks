# Creates a node group resource on EKS. This instances are managed by EKS directly
# More info in https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group
resource "aws_eks_node_group" "node_group" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types

    labels = {
      lifecycle = "OnDemand"
    }

  # Configures de min and max number of instances
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  # Configures the remote access to instances. Uses a SSH Key created on AWS
  remote_access {
    source_security_group_ids = var.source_security_group_ids
    ec2_ssh_key               = var.ssh_key
  }
  tags = {
    Project = "Add Node Grup to EKS for Demo"
  }
}