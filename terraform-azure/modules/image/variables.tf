variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }

variable "os_type" {
  type    = string
  default = "Linux"
}

variable "os_state" {
  type    = string
  default = "Generalized"
}

variable "blob_uri" { type = string }

variable "caching" {
  type    = string
  default = "ReadWrite"
}

variable "storage_type" {
  type    = string
  default = "Standard_LRS"
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
