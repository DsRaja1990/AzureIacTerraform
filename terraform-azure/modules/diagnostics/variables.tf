// diagnostics variables.tf

variable "diagnostic_name" {
  type = string
}

variable "target_resource_id" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "enabled_logs" {
  type    = list(string)
  default = []
}

variable "metrics" {
  type    = list(string)
  default = []
}

variable "rbac_assignments" {
  type = list(object({
    role_definition_name = string
    principal_id         = string
  }))
  default = []
}
