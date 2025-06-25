variable "sql_server_name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "version" {
  type    = string
  default = "12.0"
}
variable "administrator_login" { type = string }
variable "administrator_login_password" { type = string }
variable "sql_database_name" { type = string }
variable "sku_name" { type = string }
variable "collation" {
  type    = string
  default = "SQL_Latin1_General_CP1_CI_AS"
}
variable "max_size_gb" {
  type    = number
  default = 5
}
variable "zone_redundant" {
  type    = bool
  default = false
}
variable "read_scale" {
  type    = bool
  default = false
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
variable "azuread_administrators" {
  type = list(object({
    login_username              = string
    object_id                   = string
    tenant_id                   = string
    azuread_authentication_only = bool
  }))
  default = []
}
variable "cmk_key_vault_key_id" {
  type    = string
  default = null
}
variable "user_assigned_identity_id" {
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
