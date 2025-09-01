resource "azurerm_network_interface_security_group_association" "azurenicnsg" {
  network_interface_id      = var.nicid
  network_security_group_id = var.nsgid
}