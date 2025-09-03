resource "azurerm_subnet" "azuresubnet" {
  name                 = var.subnetname
  resource_group_name  = var.rgname
  virtual_network_name = var.vnetname
  address_prefixes     = var.addrsub

}