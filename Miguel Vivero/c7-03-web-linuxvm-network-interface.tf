resource "azurerm_network_interface" "web_linuxvm_nic" {
  name                = "web-linuxvm-nic"
  location            = "eastus"
  resource_group_name = "datname"

  ip_configuration {
    name                          = "web-linuxvm-ip-1"
    subnet_id                     = "azurerm_subnet"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.web_linuxvm_publicip.id 
  }
}