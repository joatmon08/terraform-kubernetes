variable "location" {
  type = map
  default = {
    azure  = "East US 2"
    google = "us-central1"
  }
}

variable "project" {}

variable "cluster_name" {}

variable "environment" {}

variable "client_id" {}

variable "client_secret" {}

variable "google_credentials" {}