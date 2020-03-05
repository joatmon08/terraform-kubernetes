resource "digitalocean_kubernetes_cluster" "engineering" {
  count  = var.cluster_provider == "do" ? 1 : 0
  name   = var.cluster_name
  region = var.location.do
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.15.5-do.1"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 1
  }
}