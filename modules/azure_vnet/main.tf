resource "azurerm_virtual_network" "azurevnet" {
  name                = var.vnetname
  location            = var.loc
  resource_group_name = var.rgname
  address_space       = ["10.0.0.0/16"]
}