resource "azurerm_public_ip" "az104-06-pip4" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.lb_rg.location
  resource_group_name = azurerm_resource_group.lb_rg.name
  allocation_method   = "Static"
  sku="Standard"
}

resource "azurerm_lb" "az104-06-lb4" {
  name                = "LoadBalancer"
  location            = azurerm_resource_group.lb_rg.location
  resource_group_name = azurerm_resource_group.lb_rg.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.az104-06-pip4.id
    
  }
  sku="Standard"
  depends_on = [
    azurerm_public_ip.az104-06-pip4
  ]
}
resource "azurerm_lb_backend_address_pool" "poolA" {
  loadbalancer_id = azurerm_lb.az104-06-lb4.id
  name            = "BackEndAddressPool"
  depends_on = [
    azurerm_lb.az104-06-lb4
  ]
}
resource "azurerm_lb_backend_address_pool_address" "appvm1_address" {
  name                    = "appvm1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.poolA.id
  virtual_network_id      = azurerm_virtual_network.vnet1.id
  ip_address              = azurerm_network_interface.nic0.private_ip_address
  depends_on = [
    azurerm_lb_backend_address_pool.poolA
  ]
}
resource "azurerm_lb_backend_address_pool_address" "appvm2_address" {
  name                    = "appvm2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.poolA.id
  virtual_network_id      = azurerm_virtual_network.vnet1.id
  ip_address              = azurerm_network_interface.nic01.private_ip_address
  depends_on = [
    azurerm_lb_backend_address_pool.poolA
  ]
}
resource "azurerm_lb_probe" "probe-1" {
  loadbalancer_id = azurerm_lb.az104-06-lb4.id
  name            = "ssh-running-probe"
  port            = 80
}
resource "azurerm_lb_rule" "lb-ruleA" {
  loadbalancer_id                = azurerm_lb.az104-06-lb4.id
  name                           = "LBRulea"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id = azurerm_lb_probe.probe-1.id
  depends_on = [
        azurerm_lb.az104-06-lb4,
        azurerm_lb_probe.probe-1
  ]
}