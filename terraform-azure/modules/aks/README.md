# Azure Kubernetes Service (AKS) Module

This module provisions a production-ready Azure Kubernetes Service (AKS) cluster with secure defaults, private networking, diagnostics, RBAC, managed identity, and full parameterization.

## Usage Example
```hcl
module "aks" {
  source                    = "./modules/aks"
  name                      = "my-aks"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  dns_prefix                = "myaks"
  kubernetes_version        = null
  sku_tier                  = "Free"
  private_cluster_enabled   = false
  node_pool_name            = "default"
  node_count                = 1
  vm_size                   = "Standard_DS2_v2"
  os_disk_size_gb           = 30
  enable_auto_scaling       = false
  min_count                 = 1
  max_count                 = 3
  vnet_subnet_id            = null
  network_plugin            = "azure"
  network_policy            = "azure"
  load_balancer_sku         = "standard"
  admin_group_object_ids    = []
  tags                      = local.tags
}
```

## Outputs
- `aks_cluster_id`    : AKS cluster resource ID
- `aks_cluster_name`  : AKS cluster name
- `aks_kube_config`   : Raw kubeconfig (sensitive)
