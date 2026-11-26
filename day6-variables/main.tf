# ==============================================================================
# MAIN CONFIGURATION (Consuming Input Variables)
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. Resource Group: Uses var.resource_group_name, var.azure_region, and var.tags
# ------------------------------------------------------------------------------
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}-${var.environment}"
  location = var.azure_region

  tags = merge(
    var.tags,
    {
      Environment = var.environment
    }
  )
}

# ------------------------------------------------------------------------------
# 2. Virtual Network: Uses var.vnet_address_space and references RG attributes
# ------------------------------------------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.environment}-01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space

  tags = var.tags
}

# ------------------------------------------------------------------------------
# 3. Subnet: Uses var.subnet_prefixes with optional creation logic
# ------------------------------------------------------------------------------
resource "azurerm_subnet" "subnet" {
  count = var.create_subnet ? 1 : 0

  name                 = "snet-${var.environment}-web"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefixes
}
