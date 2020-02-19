output "cluster" {
  value     = azurerm_kubernetes_cluster.engineering.name
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.engineering.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.engineering.kube_config_raw
  sensitive = true
}