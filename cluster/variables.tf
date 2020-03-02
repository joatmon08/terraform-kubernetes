variable "location" {
  type    = string
  default = "us-central1"
}

variable "cluster_name" {
  type        = string
  description = "Name of cluster, will be combined with environment"
}

variable "environment" {
  type        = string
  description = "Environment of cluster"
}

variable "google_credentials" {
  type        = string
  description = "Google credentials in JSON"
}

variable "google_project" {
  type        = string
  description = "Google Project to deploy cluster"
}

variable "username" {
  type = string
  default = "admin"
  description = "Username for cluster"
}

variable "password" {
  type = string
  description = "Password for cluster"
}