terraform {
  backend "remote" {
    organization = "hashicorp-team-da-beta"

    workspaces {
      name = "qa-kubernetes-vault"
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
    load_config_file       = false
    host                   = data.terraform_remote_state.cluster.outputs.host
    token                  = data.terraform_remote_state.cluster.outputs.token
    cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate
  }
}