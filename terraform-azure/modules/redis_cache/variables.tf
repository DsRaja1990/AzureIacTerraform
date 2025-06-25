variable "redis_cache_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "capacity" { type = number }
variable "family" { type = string }
variable "sku_name" { type = string }
variable "shard_count" {
  type    = number
  default = 0
}
variable "subnet_id" {
  type    = string
  default = null
}
variable "static_ip" {
  type    = string
  default = null
}
variable "redis_configuration" {
  type    = map(any)
  default = {}
}
variable "enable_private_endpoint" {
  type    = bool
  default = false
}
variable "private_endpoint_subnet_id" {
  type    = string
  default = null
}
variable "log_analytics_workspace_id" {
  type    = string
  default = null
}
variable "rbac_assignments" {
  type = list(object({
    role_definition_name = string
    principal_id         = string
  }))
  default = []
}
variable "tags" {
  type    = map(string)
  default = {}
}
