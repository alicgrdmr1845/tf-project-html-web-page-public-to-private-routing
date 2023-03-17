#route table 2 to 3
resource "azurerm_route_table" "az104-rt23" {
  name                = "routetable-2to3"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  route {
    name                   = "2to3"
    address_prefix         = "10.63.0.0/24"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.60.0.4"
  }
}

resource "azurerm_subnet_route_table_association" "route-association" {
  subnet_id      = azurerm_subnet.vnet2_subnet21.id
  route_table_id = azurerm_route_table.az104-rt23.id
}

#route table 3-2
resource "azurerm_route_table" "az104-rt32" {
  name                = "routetable-3to2"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  route {
    name                   = "routetable-3to2"
    address_prefix         = "10.62.0.0/24"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.60.0.4"
  }
}

resource "azurerm_subnet_route_table_association" "route-association1" {
  subnet_id      = azurerm_subnet.vnet3_subnet31.id
  route_table_id = azurerm_route_table.az104-rt32.id
}
