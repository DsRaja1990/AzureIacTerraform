variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "publisher_name" { type = string }
variable "publisher_email" { type = string }
variable "sku_name" {
  type    = string
  default = "Developer_1"
}
variable "virtual_network_type" {
  type    = string
  default = "External"
}
variable "subnet_id" { type = string }
variable "vnet_id" { type = string }
variable "tags" { type = map(string) }
variable "log_analytics_workspace_id" {
  type    = string
  default = null
}
variable "rbac_assignments" {
  type = list(object({
    role_definition_name = string
    principal_id         = string
  }))
  default = []
}
