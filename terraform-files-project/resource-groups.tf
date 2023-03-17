# Create a resource group for vnets and vms configuration 
resource "azurerm_resource_group" "RG" {
  name     = "az-104-06-rg1"
  location = var.location
}
# Create a resource group for the load balancer
resource "azurerm_resource_group" "lb_rg" {
  name     = "az-104-06-rg4"
  location = var.location
}
#Create a resource group for the application gateway
resource "azurerm_resource_group" "appgw_rg" {
  name     = "az-104-06-rg5"
  location = var.location
}