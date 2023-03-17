variable "location" {
  type        = string
  description = "The location where the resource group will be created."
  default     = "eastus"
}
variable "vnet1_name" {
  type        = string
  description = "Name of the virtual network to create."
  default     = "az104-06-vnet01"
}
variable "vnet1_address_space" {
  type        = list(string)
  description = "Address space for the virtual network."
  default     = ["10.60.0.0/22"]
}

variable "vnet1_subnet1_name" {
  type        = string
  description = "Name of the subnet to create."
  default     = "subnet1"
}

variable "vnet1_subnet1_address_prefix" {
  type        = string
  description = "Address prefix for the subnet."
  default     = "10.60.0.0/24"
}

variable "vnet1_subnet2_name" {
  type        = string
  description = "Name of the subnet to create."
  default     = "subnet2"
}

variable "vnet1_subnet2_address_prefix" {
  type        = string
  description = "Address prefix for the subnet."
  default     = "10.60.1.0/24"
}

variable "vnet2_name" {
  type        = string
  description = "Name of the virtual network to create."
  default     = "az104-06-vnet2"
}

variable "vnet2_address_space" {
  type        = list(string)
  description = "Address space for the virtual network."
  default     = ["10.62.0.0/22"]
}


variable "vnet2_subnet1_name" {
  type        = string
  description = "Name of the subnet to create."
  default     = "subnet1"
}

variable "vnet2_subnet1_address_prefix" {
  type        = string
  description = "Address prefix for the subnet."
  default     = "10.62.0.0/24"
}

variable "vnet3_name" {
  type        = string
  description = "Name of the virtual network to create."
  default     = "az104-06-vnet3"
}

variable "vnet3_address_space" {
  type        = list(string)
  description = "Address space for the virtual network."
  default     = ["10.63.0.0/22"]
}


variable "vnet3_subnet1_name" {
  type        = string
  description = "Name of the subnet to create."
  default     = "subnet1"
}

variable "vnet3_subnet1_address_prefix" {
  type        = string
  description = "Address prefix for the subnet."
  default     = "10.63.0.0/24"
}
variable "vnet1_subnet_appgw_name" {
  type        = string
  description = "Name of the subnet to create."
  default     = "subnet-appgw"
}
variable "vnet1_subnet_vnetgw_name" {
  type        = string
  description = "Name of the subnet to create."
  default     = "GatewaySubnet"
}

variable "vnet1_subnet_appgw_address_prefix" {
  type        = string
  description = "Address prefix for the subnet."
  default     = "10.60.3.224/27"
}
variable "vnet1_subnet_vnetgw_address_prefix" {
  type        = string
  description = "Address prefix for the subnet."
  default     = "10.60.2.0/24"
}
variable "admin_username" {
  type        = string
  description = "Username for the admin user."
  default     = "YourUserNameHere"
}

variable "admin_password" {
  type        = string
  description = "Password for the admin user."
  default     = "YourPasswordHere"
}