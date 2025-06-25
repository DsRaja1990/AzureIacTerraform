// Azure CDN module variables.tf

variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "sku" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "endpoint_name" {
  type = string
}

variable "is_http_allowed" {
  type = bool
}

variable "is_https_allowed" {
  type = bool
}

variable "origin_host_header" {
  type = string
}

variable "origin_name" {
  type = string
}

variable "origin_host_name" {
  type = string
}

variable "origin_http_port" {
  type = number
}

variable "origin_https_port" {
  type = number
}

variable "log_analytics_workspace_id" {
  type = string
}
