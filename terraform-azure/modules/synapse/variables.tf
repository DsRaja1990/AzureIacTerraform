// synapse variables.tf

variable "workspace_name" {
  description = "The name of the Synapse workspace."
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

variable "data_lake_filesystem_id" {
  description = "The resource ID of the Data Lake Gen2 filesystem."
  type        = string
}

variable "sql_admin_login" {
  description = "The SQL administrator login name."
  type        = string
}

variable "sql_admin_password" {
  description = "The SQL administrator login password."
  type        = string
  sensitive   = true
}

variable "sql_pool_name" {
  description = "The name of the Synapse SQL pool."
  type        = string
}

variable "sql_pool_sku" {
  description = "The SKU name for the Synapse SQL pool."
  type        = string
  default     = "DW100c"
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
