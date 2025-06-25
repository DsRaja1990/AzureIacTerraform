// rbac variables.tf

variable "assignments" {
  description = "List of RBAC assignments. Each object must have scope, role_definition_name, and principal_id."
  type = list(object({
    scope                = string
    role_definition_name = string
    principal_id         = string
  }))
}
