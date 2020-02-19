resource "azurerm_resource_group" "engineering" {
  name     = var.cluster_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "engineering" {
  name                = "${var.cluster_name}-cluster-${var.environment}"
  location            = azurerm_resource_group.engineering.location
  resource_group_name = azurerm_resource_group.engineering.name
  dns_prefix          = "${var.cluster_name}-cluster-qa"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = {
    Environment = var.environment
  }
}