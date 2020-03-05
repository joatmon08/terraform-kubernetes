variable "location" {
  type = map
  default = {
    gcp = "us-central1-f"
    do  = "sfo1"
  }
}

variable "cluster_provider" {
  type        = string
  default     = "gke"
  description = "Cluster provider, can be gke or do"
}

variable "cluster_name" {
  type        = string
  description = "Name of cluster, will be combined with environment"
}

variable "environment" {
  type        = string
  description = "Environment of cluster"
}

variable "google_project" {
  type        = string
  description = "Google Project to deploy cluster"
}

variable "username" {
  type        = string
  default     = "admin"
  description = "Username for cluster"
}

variable "password" {
  type        = string
  description = "Password for cluster"
}