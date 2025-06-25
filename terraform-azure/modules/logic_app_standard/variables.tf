// Azure Logic Apps Standard module variables.tf

variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "app_service_plan_id" { type = string }
variable "storage_account_name" { type = string }
variable "storage_account_access_key" { type = string }
variable "tags" { type = map(string) }
variable "log_analytics_workspace_id" { type = string }
