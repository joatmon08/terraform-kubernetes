resource "helm_release" "vault" {
  name      = var.environment
  chart     = "${path.module}/vault-helm"
  namespace = var.namespace

  set {
    name  = "server.ha.enabled"
    value = "true"
  }
}