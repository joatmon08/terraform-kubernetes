output "cluster" {
  value = var.cluster_provider == "gke" ? google_container_cluster.engineering.name : digitalocean_kubernetes_cluster.engineering.0.name
}

output "host" {
  value     = var.cluster_provider == "gke" ? google_container_cluster.engineering.endpoint : digitalocean_kubernetes_cluster.engineering.0.endpoint
  sensitive = true
}

output "token" {
  value     = var.cluster_provider == "gke" ? data.google_client_config.default.access_token : digitalocean_kubernetes_cluster.engineering.0.kube_config.0.token
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = var.cluster_provider == "gke" ? base64decode(google_container_cluster.engineering.master_auth.0.cluster_ca_certificate) : base64decode(digitalocean_kubernetes_cluster.engineering.0.kube_config.0.cluster_ca_certificate)
  sensitive = true
}

output "username" {
  value     = var.cluster_provider == "gke" ? google_container_cluster.engineering.master_auth.0.username : ""
  sensitive = true
}

output "password" {
  value     = var.cluster_provider == "gke" ? google_container_cluster.engineering.master_auth.0.password : ""
  sensitive = true
}
