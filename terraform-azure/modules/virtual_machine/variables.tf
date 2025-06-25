variable "naming_prefix" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "size" {
  type    = string
  default = "Standard_B2ms"
}
variable "admin_username" { type = string }
variable "admin_ssh_public_key" { type = string }
variable "network_interface_id" { type = string }
variable "os_disk_type" {
  type    = string
  default = "Standard_LRS"
}
variable "image_publisher" {
  type    = string
  default = "Canonical"
}
variable "image_offer" {
  type    = string
  default = "UbuntuServer"
}
variable "image_sku" {
  type    = string
  default = "18.04-LTS"
}
variable "image_version" {
  type    = string
  default = "latest"
}
variable "tags" { type = map(string) }
variable "disk_encryption_set_id" {
  type    = string
  default = null
}
variable "identity_type" {
  type    = string
  default = "SystemAssigned"
}
variable "custom_data" {
  type    = string
  default = null
}
variable "boot_diagnostics_sa_uri" {
  type    = string
  default = null
}
variable "extensions" {
  type = list(object({
    name                 = string
    publisher            = string
    type                 = string
    type_handler_version = string
    settings             = any
    protected_settings   = any
  }))
  default = []
}
variable "log_analytics_workspace_id" {
  type    = string
  default = null
}
variable "enable_auto_shutdown" {
  type    = bool
  default = false
}
variable "auto_shutdown_time" {
  type    = string
  default = "1800"
}
variable "auto_shutdown_timezone" {
  type    = string
  default = "UTC"
}
variable "auto_shutdown_notification_enabled" {
  type    = bool
  default = false
}
variable "auto_shutdown_notification_email" {
  type    = string
  default = null
}
variable "auto_shutdown_notification_webhook" {
  type    = string
  default = null
}
