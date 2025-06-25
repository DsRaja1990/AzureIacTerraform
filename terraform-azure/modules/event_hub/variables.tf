variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "sku" { 
type = string 
default = "Standard"
 }
variable "partition_count" {
     type = number 
     default = 2 
     }
variable "message_retention" { 
type = number
 default = 1
  }
variable "tags" { type = map(string) }
variable "log_analytics_workspace_id" {
  description = "The Log Analytics workspace ID for diagnostics."
  type        = string
  default     = null
}
