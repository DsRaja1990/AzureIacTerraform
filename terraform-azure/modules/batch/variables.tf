// Azure Batch module variables.tf

variable "name" {
  description = "The name of the Azure Batch account."
  type        = string
}

variable "location" {
  description = "The Azure region where the Batch account will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Batch account will be created."
  type        = string
}

variable "pool_allocation_mode" {
  description = "The allocation mode for the pool. Can be 'BatchService' or 'UserSubscription'."
  type        = string
}

variable "identity_type" {
  description = "The type of managed identity to use for the Batch account. Can be 'SystemAssigned', 'UserAssigned', or 'None'."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Batch account."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace for monitoring and logging."
  type        = string
}
