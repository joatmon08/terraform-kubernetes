output "cluster" {
  value = try(google_container_cluster.engineering.0.name, azurerm_kubernetes_cluster.engineering.0.name)
}

output "host" {
  value     = try(google_container_cluster.engineering.0.endpoint, azurerm_kubernetes_cluster.engineering.0.kube_config.0.host)
  sensitive = true
}

output "password" {
  value     = try(google_container_cluster.engineering.0.master_auth.0.password, azurerm_kubernetes_cluster.engineering.0.kube_config.0.password)
  sensitive = true
}

output "username" {
  value     = try(google_container_cluster.engineering.0.master_auth.0.username, azurerm_kubernetes_cluster.engineering.0.kube_config.0.username)
  sensitive = true
}

output "client_certificate" {
  value     = try(base64decode(google_container_cluster.engineering.0.master_auth.0.client_certificate), azurerm_kubernetes_cluster.engineering.0.kube_config.0.client_certificate)
  sensitive = true
}

output "client_key" {
  value     = try(base64decode(google_container_cluster.engineering.0.master_auth.0.client_key), azurerm_kubernetes_cluster.engineering.0.kube_config.0.client_key)
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = try(base64decode(google_container_cluster.engineering.0.master_auth.0.cluster_ca_certificate), azurerm_kubernetes_cluster.engineering.0.kube_config.0.cluster_ca_certificate)
  sensitive = true
}