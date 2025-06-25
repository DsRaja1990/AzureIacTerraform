variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "app_service_plan_id" { type = string }
variable "storage_account_name" { type = string }
variable "storage_account_access_key" { type = string }
variable "runtime_version" {
  type    = string
  default = "~4"
}
variable "os_type" {
  type    = string
  default = "linux"
}
variable "app_settings" {
  type    = map(string)
  default = {}
}
variable "subnet_id" { type = string }
variable "vnet_id" { type = string }
variable "tags" { type = map(string) }
