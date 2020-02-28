variable "environment" {
  type        = string
  description = "Environment to describe Consul Helm release"
}

variable "namespace" {
  type        = string
  description = "Namespace to which to deploy the Consul Helm chart"
}

variable "cluster_workspace" {
  type        = string
  description = "Workspace that created the Kubernetes cluster"
}

variable "organization" {
  type        = string
  description = "Organization of workspace that created the Kubernetes cluster"
}

variable "replicas" {
  type        = number
  default     = 3
  description = "Number of consul replicas"
}