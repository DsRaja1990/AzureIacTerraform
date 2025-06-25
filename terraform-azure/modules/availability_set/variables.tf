variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "fault_domain_count" {
  type    = number
  default = 2
}
variable "update_domain_count" {
  type    = number
  default = 5
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
