variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "routing_rule_name" { type = string }
variable "accepted_protocols" {
  type    = list(string)
  default = ["Https"]
}
variable "patterns_to_match" {
  type    = list(string)
  default = ["/*"]
}
variable "frontend_endpoint_name" { type = string }
variable "host_name" { type = string }
variable "backend_pool_name" { type = string }
variable "backend_host_header" { type = string }
variable "backend_address" { type = string }
variable "backend_http_port" {
  type    = number
  default = 80
}
variable "backend_https_port" {
  type    = number
  default = 443
}
variable "tags" {
  type    = map(string)
  default = {}
}
