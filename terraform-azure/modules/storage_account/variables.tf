variable "storage_account_name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "account_tier" { type = string }
variable "account_replication_type" { type = string }

variable "is_hns_enabled" {
  type    = bool
  default = false
}
variable "ip_rules" {
  type    = list(string)
  default = []
}
variable "virtual_network_subnet_ids" {
  type    = list(string)
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
variable "enable_lifecycle" {
  type    = bool
  default = false
}
variable "rbac_assignments" {
  type = list(object({
    role_definition_name = string
    principal_id         = string
  }))
  default = []
}
