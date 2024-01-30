

resource "azurerm_public_ip" "web_linuxvm_publicip" {
  name                = "linuxvm-publicip"
  resource_group_name = "datname"
  location            = "eastus"
  allocation_method   = "Static"
  sku = "Standard"
  #domain_name_label = "app1-vm-${random_string.myrandom.id}"



}

