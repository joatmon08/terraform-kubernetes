variable "location" {
  type = map
  default = {
    azure  = "East US 2"
    google = "us-central1"
  }
}

variable "cluster_name" {
  type        = string
  description = "Name of cluster, will be combined with environment"
}

variable "environment" {
  type        = string
  description = "Environment of cluster"
}

variable "azure_client_id" {
  type        = string
  description = "Azure client ID"
}

variable "azure_client_secret" {
  type        = string
  description = "Azure client secret"
}

variable "username" {
  type        = string
  description = "Google cluster username"
}

variable "password" {
  type        = string
  description = "Google cluster password"
}

variable "google_credentials" {
  type        = string
  description = "Google credentials in JSON"
}

variable "google_project" {
  type        = string
  description = "Google Project to deploy cluster"
}