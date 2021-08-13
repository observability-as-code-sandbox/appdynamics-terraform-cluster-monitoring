

output "cluster_region" {
  description = "AWS region"
  value       = module.aws_eks.cluster_region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.aws_eks.cluster_name
}

