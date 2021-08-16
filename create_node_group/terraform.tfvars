node_group_name = "node_group-00"
ssh_key         = "EKS"
instance_types  = ["t2.small"]
labels          = { "environment"="DEV" , "group_node"="node_group-00"}
desired_size    = 3
max_size        = 3
min_size        = 2
