variable "naming_prefix" { type = string }
variable "environment" { type = string }
variable "location" { type = string }
variable "owner" { type = string }
variable "cost_center" { type = string }
variable "extra_tags" {
  type    = map(string)
  default = {}
}

variable "resource_group_name" { type = string }
variable "vnet_address_space" { type = list(string) }
variable "vnet_dns_servers" { type = list(string) }

# App Service
variable "app_service_subnet_id" { type = string }
variable "app_service_kind" { type = string }
variable "app_service_reserved" { type = bool }
variable "app_service_sku_tier" { type = string }
variable "app_service_sku_size" { type = string }
variable "app_service_identity_type" { type = string }
variable "app_service_cors_allowed_origins" { type = list(string) }
variable "app_service_cors_support_credentials" { type = bool }
variable "app_service_ip_restriction" { type = list(any) }
variable "app_service_scm_ip_restriction" { type = list(any) }
variable "app_service_auth_enabled" { type = bool }
variable "app_service_auth_default_provider" { type = string }
variable "app_service_auth_issuer" { type = string }

# Key Vault
variable "key_vault_name" { type = string }
variable "tenant_id" { type = string }
variable "key_vault_sku_name" { type = string }
variable "key_vault_enable_rbac_authorization" { type = bool }
variable "key_vault_ip_rules" { type = list(string) }
variable "key_vault_virtual_network_subnet_ids" { type = list(string) }
variable "key_vault_access_policies" { type = list(any) }
variable "key_vault_enable_private_endpoint" { type = bool }
variable "key_vault_private_endpoint_subnet_id" { type = string }
variable "key_vault_log_analytics_workspace_id" { type = string }
variable "key_vault_cmk_key_vault_key_id" { type = string }
variable "key_vault_user_assigned_identity_id" { type = string }

# SQL Database
variable "sql_server_name" { type = string }
variable "sql_database_version" { type = string }
variable "sql_database_administrator_login" { type = string }
variable "sql_database_administrator_login_password" { type = string }
variable "sql_database_name" { type = string }
variable "sql_database_sku_name" { type = string }
variable "sql_database_collation" { type = string }
variable "sql_database_max_size_gb" { type = number }
variable "sql_database_zone_redundant" { type = bool }
variable "sql_database_read_scale" { type = bool }
variable "sql_database_enable_private_endpoint" { type = bool }
variable "sql_database_private_endpoint_subnet_id" { type = string }
variable "sql_database_log_analytics_workspace_id" { type = string }
variable "sql_database_azuread_administrators" { type = list(any) }
variable "sql_database_cmk_key_vault_key_id" { type = string }
variable "sql_database_user_assigned_identity_id" { type = string }

# Storage Account
variable "storage_account_name" { type = string }
variable "storage_account_tier" { type = string }
variable "storage_account_replication_type" { type = string }
variable "storage_account_is_hns_enabled" { type = bool }
variable "storage_account_ip_rules" { type = list(string) }
variable "storage_account_virtual_network_subnet_ids" { type = list(string) }
variable "storage_account_enable_private_endpoint" { type = bool }
variable "storage_account_private_endpoint_subnet_id" { type = string }
variable "storage_account_log_analytics_workspace_id" { type = string }
variable "storage_account_cmk_key_vault_key_id" { type = string }
variable "storage_account_user_assigned_identity_id" { type = string }
variable "storage_account_enable_lifecycle" { type = bool }
variable "storage_account_rbac_assignments" { type = list(any) }

# NSG
variable "nsg_security_rules" { type = list(any) }
variable "nsg_log_analytics_workspace_id" { type = string }
variable "nsg_rbac_assignments" { type = list(any) }
variable "nsg_inbound_rules" { type = list(any) }
variable "nsg_outbound_rules" { type = list(any) }

# Subnet
variable "subnet_address_prefixes" { type = list(string) }
variable "subnet_service_endpoints" { type = list(string) }
variable "subnet_delegation" { type = any }

# Virtual Machine
variable "vm_size" { type = string }
variable "vm_admin_username" { type = string }
variable "vm_admin_ssh_public_key" { type = string }
variable "vm_network_interface_id" { type = string }
variable "vm_os_disk_type" { type = string }
variable "vm_image_publisher" { type = string }
variable "vm_image_offer" { type = string }
variable "vm_image_sku" { type = string }
variable "vm_image_version" { type = string }
variable "vm_disk_encryption_set_id" { type = string }
variable "vm_identity_type" { type = string }
variable "vm_custom_data" { type = string }
variable "vm_boot_diagnostics_sa_uri" { type = string }
variable "vm_extensions" { type = list(any) }
variable "vm_log_analytics_workspace_id" { type = string }

# AKS
variable "aks_name" { type = string }
variable "aks_dns_prefix" { type = string }
variable "aks_kubernetes_version" { type = string }
variable "aks_sku_tier" { type = string }
variable "aks_private_cluster_enabled" { type = bool }
variable "aks_node_pool_name" { type = string }
variable "aks_node_count" { type = number }
variable "aks_vm_size" { type = string }
variable "aks_os_disk_size_gb" { type = number }
variable "aks_min_count" { type = number }
variable "aks_max_count" { type = number }
variable "aks_vnet_subnet_id" { type = string }
variable "aks_network_plugin" { type = string }
variable "aks_network_policy" { type = string }
variable "aks_load_balancer_sku" { type = string }
variable "aks_admin_group_object_ids" { type = list(string) }

# Bastion
variable "bastion_dns_name" { type = string }
variable "bastion_subnet_id" { type = string }
variable "bastion_public_ip_address_id" { type = string }
variable "bastion_log_analytics_workspace_id" { type = string }
variable "bastion_rbac_assignments" { type = list(any) }

# App Gateway
variable "app_gateway_sku_name" { type = string }
variable "app_gateway_sku_tier" { type = string }
variable "app_gateway_sku_capacity" { type = number }
variable "app_gateway_subnet_id" { type = string }
variable "app_gateway_public_ip_address_id" { type = string }
variable "app_gateway_frontend_port" { type = number }
variable "app_gateway_backend_fqdns" { type = list(string) }
variable "app_gateway_backend_port" { type = number }
variable "app_gateway_backend_protocol" { type = string }
variable "app_gateway_listener_protocol" { type = string }

# Event Hub
variable "event_hub_sku" { type = string }
variable "event_hub_partition_count" { type = number }
variable "event_hub_message_retention" { type = number }
variable "event_hub_log_analytics_workspace_id" { type = string }

# Service Bus
variable "service_bus_sku" { type = string }
variable "service_bus_enable_partitioning" { type = bool }
variable "service_bus_max_size_in_megabytes" { type = number }
variable "service_bus_max_delivery_count" { type = number }

# Log Analytics
variable "log_analytics_name" { type = string }
variable "log_analytics_sku" { type = string }
variable "log_analytics_retention_in_days" { type = number }

# RBAC
variable "rbac_assignments" { type = list(any) }

# Traffic Manager
variable "traffic_manager_name" { type = string }
variable "traffic_manager_profile_status" { type = string }
variable "traffic_manager_traffic_routing_method" { type = string }
variable "traffic_manager_dns_relative_name" { type = string }
variable "traffic_manager_dns_ttl" { type = number }
variable "traffic_manager_monitor_protocol" { type = string }
variable "traffic_manager_monitor_port" { type = number }
variable "traffic_manager_monitor_path" { type = string }
variable "traffic_manager_monitor_interval_in_seconds" { type = number }
variable "traffic_manager_monitor_timeout_in_seconds" { type = number }
variable "traffic_manager_monitor_tolerated_number_of_failures" { type = number }
variable "traffic_manager_tags" { type = map(string) }
variable "traffic_manager_log_analytics_workspace_id" { type = string }

# Virtual Machine Scale Set
variable "vmss_sku" { type = string }
variable "vmss_instances" { type = number }
variable "vmss_admin_username" { type = string }
variable "vmss_admin_ssh_public_key" { type = string }
variable "vmss_subnet_id" { type = string }
variable "vmss_os_disk_type" { type = string }
variable "vmss_image_publisher" { type = string }
variable "vmss_image_offer" { type = string }
variable "vmss_image_sku" { type = string }
variable "vmss_image_version" { type = string }
variable "vmss_disk_encryption_set_id" { type = string }
variable "vmss_identity_type" { type = string }
variable "vmss_custom_data" { type = string }
variable "vmss_boot_diagnostics_sa_uri" { type = string }
variable "vmss_enable_autoscale" { type = bool }
variable "vmss_autoscale_min" { type = string }
variable "vmss_autoscale_max" { type = string }
variable "vmss_log_analytics_workspace_id" { type = string }

# CDN (remaining)
variable "cdn_name" { type = string }
variable "cdn_sku" { type = string }
variable "cdn_endpoint_name" { type = string }
variable "cdn_log_analytics_workspace_id" { type = string }

# Container Instance (ensure all present)
variable "container_instance_name" { type = string }
variable "container_instance_os_type" { type = string }
variable "container_instance_ip_address_type" { type = string }
variable "container_instance_dns_name_label" { type = string }
variable "container_instance_restart_policy" { type = string }
variable "container_instance_container_name" { type = string }
variable "container_instance_image" { type = string }
variable "container_instance_cpu" { type = number }
variable "container_instance_memory" { type = number }
variable "container_instance_port" { type = number }
variable "container_instance_protocol" { type = string }
variable "container_instance_environment_variables" { type = map(string) }
variable "container_instance_secure_environment_variables" { type = map(string) }
variable "container_instance_commands" { type = list(string) }
variable "container_instance_log_analytics_workspace_id" { type = string }
variable "container_instance_log_analytics_workspace_key" { type = string }

# Private DNS
variable "private_dns_zone_name" { type = string }
variable "private_dns_vnet_id" { type = string }
variable "private_dns_registration_enabled" { type = bool }
variable "private_dns_log_analytics_workspace_id" { type = string }
variable "private_dns_rbac_assignments" { type = list(any) }

# Managed Identity
variable "managed_identity_name" { type = string }

# Monitor
variable "monitor_name" { type = string }
variable "monitor_short_name" { type = string }

# Function App
variable "function_app_service_plan_id" { type = string }
variable "function_app_storage_account_name" { type = string }
variable "function_app_storage_account_access_key" { type = string }
variable "function_app_runtime_version" { type = string }
variable "function_app_os_type" { type = string }
variable "function_app_app_settings" { type = map(string) }
variable "function_app_subnet_id" { type = string }
variable "function_app_vnet_id" { type = string }

# Logic App
variable "logic_app_definition" { type = string }
variable "logic_app_parameters" { type = map(any) }
