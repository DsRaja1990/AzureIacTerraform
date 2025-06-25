// data_explorer variables.tf

variable "cluster_name" {
  description = "The name of the Kusto (Data Explorer) cluster."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy to."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the cluster."
  type        = string
  default     = "Standard_D13_v2"
}

variable "sku_capacity" {
  description = "The SKU capacity for the cluster."
  type        = number
  default     = 2
}

variable "database_name" {
  description = "The name of the Kusto database."
  type        = string
}

variable "hot_cache_period" {
  description = "The hot cache period for the database."
  type        = string
  default     = "P7D"
}

variable "soft_delete_period" {
  description = "The soft delete period for the database."
  type        = string
  default     = "P31D"
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
