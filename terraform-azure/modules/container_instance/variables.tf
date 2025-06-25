variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "os_type" {
  type    = string
  default = "Linux"
}
variable "ip_address_type" {
  type    = string
  default = "Public"
}
variable "dns_name_label" {
  type    = string
  default = null
}
variable "restart_policy" {
  type    = string
  default = "Always"
}
variable "container_name" { type = string }
variable "image" { type = string }
variable "cpu" {
  type    = number
  default = 1
}
variable "memory" {
  type    = number
  default = 1.5
}
variable "port" {
  type    = number
  default = 80
}
variable "protocol" {
  type    = string
  default = "TCP"
}
variable "environment_variables" {
  type    = map(string)
  default = {}
}
variable "secure_environment_variables" {
  type    = map(string)
  default = {}
}
variable "commands" {
  type    = list(string)
  default = []
}
variable "log_analytics_workspace_id" {
  type    = string
  default = null
}
variable "log_analytics_workspace_key" {
  type    = string
  default = null
}
variable "tags" {
  type    = map(string)
  default = {}
}
