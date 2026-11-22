# ------------------------------------------------------------------------------
# Outputs: Exposing Computed / Exported Attributes
# ------------------------------------------------------------------------------

output "resource_group_id" {
  description = "The fully qualified Azure Resource Manager ID of the Resource Group (Exported Attribute)"
  value       = azurerm_resource_group.rg_example.id
}

output "resource_group_location" {
  description = "The Azure region where the Resource Group was created"
  value       = azurerm_resource_group.rg_example.location
}

output "virtual_network_id" {
  description = "The fully qualified ID of the Virtual Network (Exported Attribute)"
  value       = azurerm_virtual_network.vnet_example.id
}

output "virtual_network_guid" {
  description = "The GUID of the Virtual Network assigned by Azure"
  value       = azurerm_virtual_network.vnet_example.guid
}
