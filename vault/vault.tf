resource "helm_release" "vault" {
  name      = "${data.terraform_remote_state.consul.outputs.environment}-vault"
  chart     = "${path.module}/vault-helm"
  namespace = data.terraform_remote_state.consul.outputs.namespace

  set {
    name  = "server.ha.enabled"
    value = "true"
  }
}