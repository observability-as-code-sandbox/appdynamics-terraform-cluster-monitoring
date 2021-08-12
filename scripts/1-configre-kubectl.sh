# https://learn.hashicorp.com/tutorials/terraform/eks

# To run the following command, you must have permission to use the eks:DescribeCluster 
# API action with the cluster that you specify. For more information, see Amazon EKS identity-based policy examples.

aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)