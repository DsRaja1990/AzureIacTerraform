variable "key_vault_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "tenant_id" { type = string }
variable "sku_name" { type = string }
variable "enable_rbac_authorization" { type = bool }
variable "ip_rules" {
  type    = list(string)
  default = []
}
variable "virtual_network_subnet_ids" {
  type    = list(string)
  default = []
}
variable "access_policies" {
  type = list(object({
    tenant_id                = string
    object_id                = string
    key_permissions          = list(string)
    secret_permissions       = list(string)
    certificate_permissions  = list(string)
    storage_permissions      = list(string)
  }))
  default = []
}
variable "enable_private_endpoint" {
  type    = bool
  default = false
}
variable "private_endpoint_subnet_id" {
  type    = string
  default = null
}
variable "log_analytics_workspace_id" {
  type    = string
  default = null
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "cmk_key_vault_key_id" {
  type    = string
  default = null
}
variable "user_assigned_identity_id" {
  type    = string
  default = null
}
