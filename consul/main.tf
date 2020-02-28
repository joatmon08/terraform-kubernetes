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
    load_config_file = false
    host             = data.terraform_remote_state.cluster.outputs.host

    client_certificate     = data.terraform_remote_state.cluster.outputs.client_certificate
    client_key             = data.terraform_remote_state.cluster.outputs.client_key
    cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate
  }
}