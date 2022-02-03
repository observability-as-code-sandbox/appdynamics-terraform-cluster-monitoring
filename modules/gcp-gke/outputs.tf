output "cluster_region" {
  value       = var.region
  description = "GCloud Region"
}

output "cluster_project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "cluster_endpoint" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE cluster_endpoint"
}

output "cluster_ca_certificate" {
  value       = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
  description = "GKE cluster_ca_certificate"
}

output "client_key" {
  value       = google_container_cluster.primary.master_auth.0.client_key
  description = "GKE client_key"
}

output "client_certificate" {
  value       = google_container_cluster.primary.master_auth.0.client_certificate
  description = "GKE client_certificate"
}
