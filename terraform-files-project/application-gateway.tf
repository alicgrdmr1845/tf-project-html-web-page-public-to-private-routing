resource "azurerm_public_ip" "az104-06-pip5" {
  name                = "appgw-ip"
  resource_group_name = azurerm_resource_group.appgw_rg.name
  location            = azurerm_resource_group.appgw_rg.location
  allocation_method   = "Dynamic"
}
resource "azurerm_application_gateway" "network" {
  name                = "appgw"
  resource_group_name = azurerm_resource_group.appgw_rg.name
  location            = azurerm_resource_group.appgw_rg.location

  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 1
  }

gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.vnet1_subnet_appgw.id
  }
frontend_port {
    name = "front-end-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "front-end-ip-config"
    public_ip_address_id = azurerm_public_ip.az104-06-pip5.id
  }
 backend_address_pool {
    name = "video-pool"
    ip_addresses = [
        "${azurerm_network_interface.nic1.private_ip_address}"
    ] 
  }
 backend_address_pool {
    name = "image-pool"
    ip_addresses = [
        "${azurerm_network_interface.nic3.private_ip_address}"
    ] 
  }
backend_http_settings {
    name                  = "HTTPSetting"
    cookie_based_affinity = "Disabled"
    path                  = ""
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
}
 http_listener {
    name                           = "listener-name"
    frontend_ip_configuration_name = "front-end-ip-config"
    frontend_port_name             = "front-end-port"
    protocol                       = "Http"
 }
 
  request_routing_rule {
    name                       = "RoutingRuleA"
    rule_type                  = "PathBasedRouting"
    url_path_map_name          = "RoutingPath" 
    http_listener_name         = "listener-name"
  }
  url_path_map {
    name                               = "RoutingPath"
    default_backend_address_pool_name  = "video-pool"
    default_backend_http_settings_name = "HTTPSetting"

    path_rule {
      
      name                             = "VideoRoutingRule"
      backend_address_pool_name        = "video-pool"
      backend_http_settings_name       = "HTTPSetting"
      paths =[
        "/videos/*",
      ]
    }  
    path_rule {
      
      name                             = "ImageRoutingRule"
      backend_address_pool_name        = "image-pool"
      backend_http_settings_name       = "HTTPSetting"
      paths =[
        "/images/*",
      ]
    }      
  }     
}