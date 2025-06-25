# Terraform Azure Production-Ready Modules

## Structure

- All major Azure PaaS and IaaS services are modularized under `/modules`.
- Use `/tfvars/dev.tfvars` for development environment variables.
- All variables are passed via tfvars → variables.tf → main.tf/module usage.
- Naming conventions and tagging are enforced via locals and variables.

## Usage

```bash
terraform init
terraform plan -var-file="tfvars/dev.tfvars"
terraform apply -var-file="tfvars/dev.tfvars"
```

## Requirements
- Terraform >= 1.6.0
- AzureRM provider >= 3.0.0

## Modules
- app_service
- key_vault
- sql_database
- storage_account
- postgresql
- mysql
- redis_cache
- api_management
- logic_app
- virtual_network
- nsg
- virtual_machine
- load_balancer
- app_gateway
- monitor
- private_dns

## Security & Best Practices
- Private endpoints for all eligible PaaS
- No public access to PaaS
- RBAC, NSGs, managed identities
- TLS, firewall, logging/monitoring
- Key Vault secrets via managed identity
- Consistent naming & tagging
- Remote backend via Azure Storage Account
