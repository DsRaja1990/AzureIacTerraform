output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.this.id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.this.name
}

output "aks_kube_config" {
  value = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive = true
}
