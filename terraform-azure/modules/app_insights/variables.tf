// app_insights variables.tf

variable "app_insights_name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "application_type" {
  type    = string
  default = "web"
}
variable "retention_in_days" {
  type    = number
  default = 90
}
variable "sampling_percentage" {
  type    = number
  default = 100
}
variable "disable_ip_masking" {
  type    = bool
  default = false
}
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
variable "tags" {
  type    = map(string)
  default = {}
}
