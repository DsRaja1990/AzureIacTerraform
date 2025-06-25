variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }

variable "fault_domain_count" {
  type    = number
  default = 1
}

variable "zones" {
  type    = list(string)
  default = []
}

variable "sku_name" {
  type    = string
  default = "DSv3-Type1"
}

variable "platform_fault_domain" {
  type    = number
  default = 0
}

variable "auto_replace_on_failure" {
  type    = bool
  default = true
}

variable "tags" { type = map(string) }
