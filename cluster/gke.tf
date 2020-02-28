resource "google_container_cluster" "engineering" {
  count    = var.choose_provider == "google" ? 1 : 0
  name     = var.cluster_name
  location = var.location[var.choose_provider]

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "engineering_preemptible_nodes" {
  count      = var.choose_provider == "google" ? 1 : 0
  name       = "${var.cluster_name}-node-pool"
  location   = var.location[var.choose_provider]
  cluster    = google_container_cluster.engineering.0.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}