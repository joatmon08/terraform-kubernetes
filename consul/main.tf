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
    config_path = "/home/terraform/.kube/config"
  }
}