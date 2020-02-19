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
    host     = terraform_remote_state.cluster.outputs.host
    username = terraform_remote_state.cluster.outputs.username
    password = terraform_remote_state.cluster.outputs.password

    client_certificate     = terraform_remote_state.cluster.outputs.client_certificate
    client_key             = terraform_remote_state.cluster.outputs.client_key
    cluster_ca_certificate = terraform_remote_state.cluster.outputs.cluster_ca_certificate
  }
}