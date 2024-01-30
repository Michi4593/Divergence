variable "business_division" {
  type    = string
}

variable "environment" {
  type    = string
}

variable "resource_group_name" {
  type    = string
}

variable "resource_group_location" {
  type    = string
}

variable "vnet_name" {
  type    = string
}

variable "vnet_address_space" {
  type    = list(string)
}

variable "web_subnet_name" {
  type    = string
}

variable "web_subnet_address" {
  type    = list(string)
}

variable "app_subnet_name" {
  type    = string
}

variable "app_subnet_address" {
  type    = list(string)
}

variable "db_subnet_name" {
  type    = string
}

variable "db_subnet_address" {
  type    = list(string)
}

variable "bastion_subnet_name" {
  type    = string
}

variable "bastion_subnet_address" {
  type    = list(string)
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "web" {
  name                 = var.web_subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes    = var.web_subnet_address
}

resource "azurerm_subnet" "app" {
  name                 = var.app_subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes    = var.app_subnet_address
}

resource "azurerm_subnet" "db" {
  name                 = var.db_subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes    = var.db_subnet_address
}

resource "azurerm_subnet" "bastion" {
  name                 = var.bastion_subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes    = var.bastion_subnet_address
}