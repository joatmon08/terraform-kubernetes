resource "azurerm_resource_group" "engineering" {
  name     = var.cluster_name
  location = var.location[var.choose_provider]
}

resource "azurerm_kubernetes_cluster" "engineering" {
  count               = var.choose_provider == "azure" ? 1 : 0
  name                = "${var.environment}-${var.cluster_name}-cluster"
  location            = azurerm_resource_group.engineering.location
  resource_group_name = azurerm_resource_group.engineering.name
  dns_prefix          = "${var.environment}-${var.cluster_name}-cluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.enable_larger_instances ? "Standard_D3_v2" : "Standard_D2_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = {
    Environment = var.environment
  }
}