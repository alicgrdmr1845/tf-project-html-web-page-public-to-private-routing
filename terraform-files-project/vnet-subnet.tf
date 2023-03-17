# Create virtual networks
resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1_name
  address_space       = var.vnet1_address_space
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_virtual_network" "vnet2" {
  name                = var.vnet2_name
  address_space       = var.vnet2_address_space
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_virtual_network" "vnet3" {
  name                = var.vnet3_name
  address_space       = var.vnet3_address_space
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

# Create subnets
resource "azurerm_subnet" "vnet1_subnet11" {
  name                 = var.vnet1_subnet1_name
  address_prefixes     = [var.vnet1_subnet1_address_prefix]
  virtual_network_name = azurerm_virtual_network.vnet1.name
  resource_group_name  = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "vnet1_subnet12" {
  name                 = var.vnet1_subnet2_name
  address_prefixes     = [var.vnet1_subnet2_address_prefix]
  virtual_network_name = azurerm_virtual_network.vnet1.name
  resource_group_name  = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "vnet1_subnet_appgw" {
  name                 = var.vnet1_subnet_appgw_name
  address_prefixes     = [var.vnet1_subnet_appgw_address_prefix]
  virtual_network_name = azurerm_virtual_network.vnet1.name
  resource_group_name  = azurerm_resource_group.RG.name
}
resource "azurerm_subnet" "vnet1_subnet_vnetgw" {
  name                 = var.vnet1_subnet_vnetgw_name
  address_prefixes     = [var.vnet1_subnet_vnetgw_address_prefix]
  virtual_network_name = azurerm_virtual_network.vnet1.name
  resource_group_name  = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "vnet2_subnet21" {
  name                 = var.vnet2_subnet1_name
  address_prefixes     = [var.vnet2_subnet1_address_prefix]
  virtual_network_name = azurerm_virtual_network.vnet2.name
  resource_group_name  = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "vnet3_subnet31" {
  name                 = var.vnet3_subnet1_name
  address_prefixes     = [var.vnet3_subnet1_address_prefix]
  virtual_network_name = azurerm_virtual_network.vnet3.name
  resource_group_name  = azurerm_resource_group.RG.name
}