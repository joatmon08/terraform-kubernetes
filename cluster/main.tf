terraform {
  backend "remote" {
    organization = "hashicorp-team-da-beta"

    workspaces {
      name = "qa-kubernetes-cluster"
    }
  }
}

provider "azurerm" {
  version = "1.44.0"
}

provider "google" {
  version     = "3.10.0"
  credentials = var.google_credentials
  project     = var.google_project
}

data "google_client_config" "default" {}