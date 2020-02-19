resource "local_file" "kubeconfig" {
  content  = data.terraform_remote_state.cluster.outputs.kubeconfig
  filename = "/home/terraform/.kube/config"
}

resource "helm_release" "consul" {
  depends_on    = [local_file.kubeconfig]
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