variable "naming_prefix" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "sku" {
  type    = string
  default = "Standard_B2ms"
}
variable "instances" {
  type    = number
  default = 2
}
variable "admin_username" { type = string }
variable "admin_ssh_public_key" { type = string }
variable "subnet_id" { type = string }
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
variable "enable_autoscale" {
  type    = bool
  default = false
}
variable "autoscale_min" {
  type    = string
  default = "1"
}
variable "autoscale_max" {
  type    = string
  default = "10"
}
variable "autoscale_default" {
  type    = string
  default = "1"
}
variable "autoscale_cpu_threshold" {
  type    = number
  default = 75
}
variable "autoscale_cpu_threshold_down" {
  type    = number
  default = 25
}
variable "log_analytics_workspace_id" {
  type    = string
  default = null
}
