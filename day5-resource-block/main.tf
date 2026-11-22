# ------------------------------------------------------------------------------
# 1. Base Resource: Azure Resource Group
# ------------------------------------------------------------------------------
# Arguments supplied: name, location, tags
# Attributes exported: id
resource "azurerm_resource_group" "rg_example" {
  # Required Arguments
  name     = "rg-day05-resources-demo"
  location = "East US"

  # Optional Argument
  tags = {
    Day         = "05"
    Topic       = "Resource Arguments and Attributes"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# ------------------------------------------------------------------------------
# 2. Dependent Resource: Virtual Network
# ------------------------------------------------------------------------------
# Demonstrates referencing exported attributes of 'rg_example' as input arguments:
# - resource_group_name = azurerm_resource_group.rg_example.name
# - location            = azurerm_resource_group.rg_example.location
resource "azurerm_virtual_network" "vnet_example" {
  # Required Arguments
  name                = "vnet-day05-demo"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_example.location # Referenced from RG attribute
  resource_group_name = azurerm_resource_group.rg_example.name     # Referenced from RG attribute (Implicit Dependency)

  # Optional Argument
  tags = {
    Tier = "Networking"
  }
}
