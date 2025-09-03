resource "azurerm_network_interface" "azurenic" {
  name                = var.nicname
  location            = var.loc
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnetid
    private_ip_address_allocation = "Dynamic"
  }
}