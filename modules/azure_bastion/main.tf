resource "azurerm_bastion_host" "azurebastion" {
  name                = var.bastionname
  location            = var.loc
  resource_group_name = var.rgname

  ip_configuration {
    name                 = "devconfiguration"
    subnet_id            = var.subnetid
    public_ip_address_id = var.pipid
  }
}