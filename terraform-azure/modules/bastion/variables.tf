variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "dns_name" { type = string }
variable "subnet_id" { type = string }
variable "public_ip_address_id" { type = string }
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
