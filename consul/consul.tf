resource "helm_release" "consul" {
  depends_on = [kubernetes_namespace.secrets]
  name       = "${var.environment}-consul"
  chart      = "${path.module}/consul-helm"
  namespace  = var.namespace

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

  set {
    name  = "ui"
    value = "true"
  }
}