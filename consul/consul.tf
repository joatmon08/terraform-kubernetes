resource "helm_release" "consul" {
  name      = var.environment
  chart     = "${path.module}/consul-helm"
  namespace = var.namespace

  set {
    name  = "global.name"
    value = "consul"
  }

  set {
    name  = "server.replicas"
    value = var.replicas
  }

  set {
    name  = "server.bootstrapExpect"
    value = var.replicas
  }
}