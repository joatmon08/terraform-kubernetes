terraform {
  backend "remote" {
    organization = "hashicorp-team-da-beta"

    workspaces {
      name = "qa-kubernetes-consul"
    }
  }
}

data "terraform_remote_state" "cluster" {
  backend = "remote"
  config = {
    organization = var.organization
    workspaces = {
      name = var.cluster_workspace
    }
  }
}

provider "helm" {
  version = "~> 1.0"
  kubernetes {
    host     = terraform_remote_state.cluster.host
    username = terraform_remote_state.cluster.username
    password = terraform_remote_state.cluster.password

    client_certificate     = terraform_remote_state.cluster.client_certificate
    client_key             = terraform_remote_state.cluster.client_key
    cluster_ca_certificate = terraform_remote_state.cluster.cluster_ca_certificate
  }
}