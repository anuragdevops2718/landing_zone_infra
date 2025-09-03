resource "azurerm_public_ip" "azurepublicip" {
  name                = var.pipname
  resource_group_name = var.rgname
  location            = var.loc
  allocation_method   = "Static"
}