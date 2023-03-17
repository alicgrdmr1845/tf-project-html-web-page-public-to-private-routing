#vm 2 in vnet2 nsg configuration
resource "azurerm_network_security_group" "nsg1" {
  name                = "az104-06-vm2-nsg"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  security_rule {
    name                       = "Allow_HTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    
  }
}
resource "azurerm_network_interface_security_group_association" "nsg1-ass-s2" {
  network_interface_id      = azurerm_network_interface.nic1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
  
}
#vm 3 in vnet3 nsg configuration
resource "azurerm_network_security_group" "nsg3" {
  name                = "az104-06-vm3-nsg"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  security_rule {
    name                       = "Allow_HTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_interface_security_group_association" "nsg-ass-s3" {
  network_interface_id      = azurerm_network_interface.nic3.id
  network_security_group_id = azurerm_network_security_group.nsg3.id
}

#vm0 in vnet1 subnet 0 nsg configuration
resource "azurerm_network_security_group" "nsg0" {
  name                = "az104-06-vm0-nsg"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  security_rule {
    name                       = "allow-rdp-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
}
resource "azurerm_network_interface_security_group_association" "nsg0-ass-s11" {
  network_interface_id      = azurerm_network_interface.nic0.id
  network_security_group_id = azurerm_network_security_group.nsg0.id
}

##vm1 in vnet1 subnet1 nsg configuration
resource "azurerm_network_security_group""nsg01" {
  name                = "az104-06-vm1-nsg"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  security_rule {
    name                       = "allow-rdp-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
 
}
resource "azurerm_network_interface_security_group_association" "nsg01-ass-s12" {
 network_interface_id      = azurerm_network_interface.nic01.id
 network_security_group_id = azurerm_network_security_group.nsg01.id
}