variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "dns_prefix" { type = string }
variable "kubernetes_version" {
  type    = string
  default = null
}
variable "sku_tier" {
  type    = string
  default = "Free"
}
variable "private_cluster_enabled" {
  type    = bool
  default = false
}
variable "node_pool_name" {
  type    = string
  default = "default"
}
variable "node_count" {
  type    = number
  default = 1
}
variable "vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}
variable "os_disk_size_gb" {
  type    = number
  default = 30
}
variable "min_count" {
  type    = number
  default = 1
}
variable "max_count" {
  type    = number
  default = 3
}
variable "vnet_subnet_id" {
  type    = string
  default = null
}
variable "network_plugin" {
  type    = string
  default = "azure"
}
variable "network_policy" {
  type    = string
  default = "azure"
}
variable "load_balancer_sku" {
  type    = string
  default = "standard"
}
variable "admin_group_object_ids" {
  type    = list(string)
  default = []
}
variable "tags" {
  type    = map(string)
  default = {}
}
