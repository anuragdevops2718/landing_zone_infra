resource "azurerm_network_security_group" "azurensg" {
  name                = var.nsgname
  location            = var.loc
  resource_group_name = var.rgname

  security_rule {
    name                       = "dev0109"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}