variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }

variable "sku" {
  type    = string
  default = "Standard"
}

variable "enable_partitioning" {
  type    = bool
  default = true
}

variable "max_size_in_megabytes" {
  type    = number
  default = 1024
}

variable "tags" { type = map(string) }

variable "max_delivery_count" {
  type    = number
  default = 10
}
