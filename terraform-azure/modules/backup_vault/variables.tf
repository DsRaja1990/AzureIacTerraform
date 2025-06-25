// Azure Backup Vault module variables.tf

variable "name" {
  description = "The name of the Backup Vault."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Backup Vault will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the Backup Vault will be created."
  type        = string
}

variable "datastore_type" {
  description = "The type of datastore for the Backup Vault."
  type        = string
}

variable "redundancy" {
  description = "The redundancy option for the Backup Vault."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Backup Vault."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace for the Backup Vault."
  type        = string
}
