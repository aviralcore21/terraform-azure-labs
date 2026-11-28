# ==============================================================================
# MAIN CONFIGURATION (Resources to be exposed via Outputs)
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. Resource Group
# ------------------------------------------------------------------------------
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}-${var.environment}"
  location = var.location
  tags     = var.tags
}

# ------------------------------------------------------------------------------
# 2. Virtual Network
# ------------------------------------------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.environment}-01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
  tags                = var.tags
}

# ------------------------------------------------------------------------------
# 3. Subnet
# ------------------------------------------------------------------------------
resource "azurerm_subnet" "frontend" {
  name                 = "snet-${var.environment}-frontend"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix
}

# ------------------------------------------------------------------------------
# 4. Public IP Address (Demonstrates dynamic computed attributes)
# ------------------------------------------------------------------------------
resource "azurerm_public_ip" "pip" {
  name                = "pip-${var.environment}-web"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "day07-web-${var.environment}"

  tags = var.tags
}

# ------------------------------------------------------------------------------
# 5. Network Security Group
# ------------------------------------------------------------------------------
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.environment}-web"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}
