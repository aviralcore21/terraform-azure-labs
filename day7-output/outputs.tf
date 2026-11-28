# ==============================================================================
# OUTPUT VALUES DEFINITION
# ==============================================================================
# Outputs expose useful resource attributes after 'terraform apply'.
# They can be read by CLI users, CI/CD pipelines, or root modules.
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. Resource Group Attributes
# ------------------------------------------------------------------------------
output "resource_group_name" {
  description = "The deployed name of the Azure Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "The fully qualified ARM ID of the Resource Group"
  value       = azurerm_resource_group.rg.id
}

output "resource_group_location" {
  description = "The Azure region hosting the infrastructure"
  value       = azurerm_resource_group.rg.location
}

# ------------------------------------------------------------------------------
# 2. Virtual Network & Subnet Attributes
# ------------------------------------------------------------------------------
output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = "The address space CIDR block(s) assigned to the VNet"
  value       = azurerm_virtual_network.vnet.address_space
}

output "subnet_id" {
  description = "The unique Azure resource ID of the frontend subnet"
  value       = azurerm_subnet.frontend.id
}

# ------------------------------------------------------------------------------
# 3. Public IP & Networking Attributes (Computed by Azure)
# ------------------------------------------------------------------------------
output "public_ip_address" {
  description = "The allocated public IPv4 address"
  value       = azurerm_public_ip.pip.ip_address
}

output "public_ip_fqdn" {
  description = "The fully qualified domain name (FQDN) assigned to the Public IP"
  value       = azurerm_public_ip.pip.fqdn
}

# ------------------------------------------------------------------------------
# 4. Structured / Composite Output (Grouping related attributes)
# ------------------------------------------------------------------------------
output "web_tier_summary" {
  description = "Consolidated summary of web-tier networking attributes"
  value = {
    resource_group = azurerm_resource_group.rg.name
    vnet_name      = azurerm_virtual_network.vnet.name
    subnet_name    = azurerm_subnet.frontend.name
    public_ip      = azurerm_public_ip.pip.ip_address
    fqdn           = azurerm_public_ip.pip.fqdn
    nsg_name       = azurerm_network_security_group.nsg.name
  }
}

# ------------------------------------------------------------------------------
# 5. Sensitive Output Example (Masked in CLI stdout)
# ------------------------------------------------------------------------------
# Marking an output as sensitive prevents plaintext exposure in console output.
output "simulated_db_connection_string" {
  description = "Simulated connection string demonstrating the sensitive flag"
  value       = "Server=${azurerm_public_ip.pip.ip_address};Database=appdb;User Id=dbadmin;Password=SuperSecretP@ssw0rd!;"
  sensitive   = true
}
