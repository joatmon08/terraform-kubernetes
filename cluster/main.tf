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