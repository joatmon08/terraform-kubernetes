variable "environment" {
  type        = string
  description = "Environment to describe Vault Helm release"
}

variable "namespace" {
  type        = string
  description = "Namespace to which to deploy the Vault Helm chart"
}

variable "cluster_workspace" {
  type        = string
  description = "Workspace that created the Kubernetes cluster"
}

variable "organization" {
  type        = string
  description = "Organization of workspace that created the Kubernetes cluster"
}