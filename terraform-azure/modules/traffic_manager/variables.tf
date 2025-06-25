// Azure Traffic Manager module variables.tf

variable "name" {
  description = "The name of the Traffic Manager profile."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Traffic Manager profile will be created."
  type        = string
}

variable "profile_status" {
  description = "The status of the Traffic Manager profile. Possible values are 'Enabled' or 'Disabled'."
  type        = string
}

variable "traffic_routing_method" {
  description = "The method used by Traffic Manager to route traffic. Possible values are 'Performance', 'Weighted', 'Priority', 'Geographic', 'Multivalue', 'Subnet', 'Asn', or 'Cookie'. "
  type        = string
}

variable "dns_relative_name" {
  description = "The relative DNS name for the Traffic Manager profile."
  type        = string
}

variable "dns_ttl" {
  description = "The DNS Time to Live (TTL) in seconds."
  type        = number
}

variable "monitor_protocol" {
  description = "The protocol used for the health probe. Possible values are 'HTTP' or 'HTTPS'."
  type        = string
}

variable "monitor_port" {
  description = "The port used for the health probe."
  type        = number
}

variable "monitor_path" {
  description = "The path of the HTTP or HTTPS endpoint used for the health probe."
  type        = string
}

variable "monitor_interval_in_seconds" {
  description = "The interval in seconds between each health probe."
  type        = number
}

variable "monitor_timeout_in_seconds" {
  description = "The timeout in seconds for the health probe."
  type        = number
}

variable "monitor_tolerated_number_of_failures" {
  description = "The number of consecutive failures required to mark the endpoint as unavailable."
  type        = number
}

variable "tags" {
  description = "A mapping of tags to assign to the Traffic Manager profile."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace for logging and monitoring."
  type        = string
}
