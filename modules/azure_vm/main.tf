resource "azurerm_linux_virtual_machine" "azurevm" {
  name                = var.vmname
  resource_group_name = var.rgname
  location            = var.loc
  size                = "Standard_F2"
  admin_username      = var.username
  admin_password      = var.password     
  network_interface_ids = var.nicid
  disable_password_authentication = false


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}