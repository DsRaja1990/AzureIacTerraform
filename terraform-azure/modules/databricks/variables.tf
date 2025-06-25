// databricks variables.tf

variable "name" {
  description = "The name of the Databricks workspace."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy to."
  type        = string
}

variable "sku" {
  description = "The SKU for the Databricks workspace."
  type        = string
  default     = "standard"
}

variable "managed_resource_group_name" {
  description = "The name of the managed resource group for Databricks."
  type        = string
}

variable "no_public_ip" {
  description = "Whether to disable public IP for the workspace."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "The Log Analytics workspace ID for diagnostics."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
