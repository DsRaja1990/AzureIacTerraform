variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }

variable "storage_account_type" {
  type    = string
  default = "Standard_LRS"
}

variable "create_option" {
  type    = string
  default = "Empty"
}

variable "disk_size_gb" {
  type    = number
  default = 128
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
