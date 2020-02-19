resource "local_file" "kubeconfig" {
  sensitive_content = data.terraform_remote_state.cluster.outputs.kubeconfig
  filename          = var.config_path
  lifecycle {
    create_before_destroy = true
  }
}

resource "helm_release" "consul" {
  depends_on = [local_file.kubeconfig]
  name       = var.environment
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
}