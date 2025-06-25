variable "naming_prefix" { type = string }
variable "resource_group_name" { type = string }
variable "dns_zone_name" { type = string }
variable "vnet_id" { type = string }
variable "registration_enabled" {
  type    = bool
  default = false
}
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
