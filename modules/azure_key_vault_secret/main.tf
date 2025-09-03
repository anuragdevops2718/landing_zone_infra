resource "azurerm_key_vault_secret" "azurekvsecret" {
  name         = var.secretname
  value        = var.secretpswd
  key_vault_id = data.azurerm_key_vault.azurermkv.id
}