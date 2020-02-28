output "cluster" {
  value = google_container_cluster.engineering.name
}

output "host" {
  value     = google_container_cluster.engineering.endpoint
  sensitive = true
}

output "token" {
  value     = data.google_client_config.default.access_token
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = base64decode(google_container_cluster.engineering.master_auth.0.cluster_ca_certificate)
  sensitive = true
}