# ==============================================================================
# OUTPUTS
# ==============================================================================

output "resource_group_name" {
  description = "The evaluated name of the Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "The ID of the created Resource Group"
  value       = azurerm_resource_group.rg.id
}

output "vnet_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = "The address space assigned to the Virtual Network"
  value       = azurerm_virtual_network.vnet.address_space
}

output "subnet_id" {
  description = "The ID of the subnet (if created)"
  value       = var.create_subnet ? azurerm_subnet.subnet[0].id : null
}
