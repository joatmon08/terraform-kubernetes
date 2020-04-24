terraform {}

provider "google" {
  version = "~> 3.10"
  project = var.google_project
  region  = var.location.gcp
}