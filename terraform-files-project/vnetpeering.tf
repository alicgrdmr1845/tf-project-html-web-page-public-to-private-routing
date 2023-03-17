resource "azurerm_virtual_network_peering" "vnet2tovnet1" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = var.vnet2_name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id
}

resource "azurerm_virtual_network_peering" "vnet1tovnet2" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = var.vnet1_name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
}
resource "azurerm_virtual_network_peering" "vnet3tovnet2" {
  name                      = "peer3to1"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = var.vnet3_name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id
}

resource "azurerm_virtual_network_peering" "vnet1tovnet3" {
  name                      = "peer1to3"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = var.vnet1_name
  remote_virtual_network_id = azurerm_virtual_network.vnet3.id
}