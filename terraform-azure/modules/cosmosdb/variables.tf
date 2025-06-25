// cosmosdb variables.tf

variable "name" {
  description = "The name of the Cosmos DB account."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy to."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "offer_type" {
  description = "The offer type for Cosmos DB (e.g., Standard)."
  type        = string
  default     = "Standard"
}

variable "kind" {
  description = "The kind of Cosmos DB account (e.g., GlobalDocumentDB)."
  type        = string
  default     = "GlobalDocumentDB"
}

variable "enable_automatic_failover" {
  description = "Enable automatic failover."
  type        = bool
  default     = false
}

variable "consistency_level" {
  description = "The consistency level."
  type        = string
  default     = "Session"
}

variable "max_interval_in_seconds" {
  description = "Max interval in seconds for bounded staleness."
  type        = number
  default     = 5
}

variable "max_staleness_prefix" {
  description = "Max staleness prefix for bounded staleness."
  type        = number
  default     = 100
}

variable "is_virtual_network_filter_enabled" {
  description = "Enable VNET filter."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Enable public network access."
  type        = bool
  default     = true
}

variable "database_name" {
  description = "The name of the Cosmos DB SQL database."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The Log Analytics workspace ID for diagnostics."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "additional_geo_locations" {
  description = "Additional geo-locations for the Cosmos DB account."
  type = list(object({
    location          = string
    failover_priority = number
  }))
  default = []
}

variable "virtual_network_subnet_ids" {
  description = "The subnet IDs for the virtual networks."
  type    = list(string)
  default = []
}

variable "capabilities" {
  description = "List of capabilities for the Cosmos DB account."
  type    = list(string)
  default = []
}

variable "cmk_key_vault_key_id" {
  description = "The Key Vault key ID for customer-managed keys."
  type    = string
  default = null
}

variable "user_assigned_identity_id" {
  description = "The user-assigned managed identity ID."
  type    = string
  default = null
}

variable "enable_private_endpoint" {
  description = "Enable private endpoint for the Cosmos DB account."
  type    = bool
  default = false
}

variable "private_endpoint_subnet_id" {
  description = "The subnet ID for the private endpoint."
  type    = string
  default = null
}

variable "rbac_assignments" {
  description = "Role-based access control assignments."
  type = list(object({
    role_definition_name = string
    principal_id         = string
  }))
  default = []
}
