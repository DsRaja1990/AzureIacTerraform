// log_analytics variables.tf

variable "name" {
  description = "The name of the Log Analytics workspace."
  type        = string
}

variable "location" {
  description = "The Azure region where the Log Analytics workspace will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Log Analytics workspace will be created."
  type        = string
}

variable "sku" {
  description = "The SKU of the Log Analytics workspace."
  type        = string
}

variable "retention_in_days" {
  description = "The number of days to retain logs in the Log Analytics workspace."
  type        = number
}

variable "tags" {
  description = "A map of tags to assign to the Log Analytics workspace."
  type        = map(string)
}
