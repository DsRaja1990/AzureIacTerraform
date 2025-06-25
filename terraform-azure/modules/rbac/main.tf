// rbac main.tf

resource "azurerm_role_assignment" "this" {
  for_each             = { for idx, assignment in var.assignments : idx => assignment }
  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = each.value.principal_id
}
