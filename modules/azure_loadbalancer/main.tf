resource "azurerm_lb" "azurelb" {
  name                = var.lbname
  location            = var.loc
  resource_group_name = var.rgname

  frontend_ip_configuration {
    name                 = "devenvpublicip0109"
    public_ip_address_id = var.pipid
  }
}