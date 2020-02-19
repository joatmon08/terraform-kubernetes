variable "environment" {}
variable "namespace" {}
variable "cluster_workspace" {}
variable "organization" {}
variable "config_path" {
  type    = string
  default = "/home/terraform/.kube/config"
}
variable "replicas" {
  default = 1
}