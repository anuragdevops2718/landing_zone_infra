resource "azurerm_resource_group" "azurerg" {
  name     = var.rgname
  location = var.loc
}