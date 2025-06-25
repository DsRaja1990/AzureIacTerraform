// Azure Managed Disk module variables.tf

variable "name" {
  description = "The name of the managed disk."
  type        = string
}

variable "location" {
  description = "The location/region where the managed disk should be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the managed disk should be created."
  type        = string
}

variable "storage_account_type" {
  description = "The type of storage account to use for the managed disk."
  type        = string
}

variable "disk_size_gb" {
  description = "The size of the managed disk in GB."
  type        = number
}

variable "create_option" {
  description = "The create option for the managed disk."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the managed disk."
  type        = map(string)
}
