#create virtual machines
#vm 2 in vnet2
resource "azurerm_network_interface" "nic1" {
  name                = "nic1-vm1-vnet2"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.vnet2_subnet21.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm1-vnet2" {
  name                = "az104-06-vm2"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]

  size                 = "Standard_B2s"
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  computer_name        = "myvm"
  enable_automatic_updates = true
  os_disk {
    name                 = "myosdisk-vm1vnet2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
#vm 3 in vnet3
resource "azurerm_network_interface" "nic3" {
  name                = "nic3-vm3-vnet3"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.vnet3_subnet31.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm3-vnet3" {
  name                = "az104-06-vm3"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
  network_interface_ids = [
    azurerm_network_interface.nic3.id,
  ]

  size                 = "Standard_B2s"
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  computer_name        = "myvm"
  enable_automatic_updates = true
  os_disk {
    name                 = "myosdisk-vm3vnet3"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

 
}
#vm0 in vnet1 subnet 0
resource "azurerm_network_interface" "nic0" {
  name                = "nic0-vm0-vnet1"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.vnet1_subnet11.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm0-vnet1" {
  name                = "az104-06-vm0"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
  network_interface_ids = [
    azurerm_network_interface.nic0.id,
  ]

  size                 = "Standard_B2s"
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  computer_name        = "myvm"
  enable_automatic_updates = true
  os_disk {
    name                 = "myosdisk-vm0vnet1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

}

#vm1 in vnet1 subnet1
resource "azurerm_network_interface" "nic01" {
  name                = "nic01-vm1-vnet1"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.vnet1_subnet12.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm01-vnet1" {
  name                = "az104-06-vm1"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
  network_interface_ids = [
    azurerm_network_interface.nic01.id,
  ]

  size                 = "Standard_B2s"
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  computer_name        = "myvm"
  enable_automatic_updates = true
  os_disk {
    name                 = "myosdisk-vm01vnet1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

}
