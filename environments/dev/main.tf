module "azrg" {
  source = "../../modules/azure_resource_group"
  rgname = "devrg0109"
  loc    = "japaneast"
}

module "azvnet" {
  source   = "../../modules/azure_vnet"
  vnetname = "devvnet0109"
  rgname   = module.azrg.azurermrg
  loc      = "japaneast"
}

module "azsubnet1" {
  depends_on = [module.azvnet]
  source     = "../../modules/azure_subnet"
  subnetname = "devsubnet010901"
  vnetname   = "devvnet0109"
  loc        = "japaneast"
  addrsub    = ["10.0.10.0/24"]
}

module "azsubnet2" {
  depends_on = [module.azvnet]
  source     = "../../modules/azure_subnet"
  subnetname = "devsubnet010902"
  vnetname   = "devvnet0109"
  loc        = "japaneast"
  addrsub    = ["10.0.11.0/24"]
}

module "azsubnetbastian" {
  depends_on = [module.azvnet]
  source     = "../../modules/azure_subnet"
  subnetname = "devbastionsubnet0109"
  vnetname   = "devvnet0109"
  loc        = "japaneast"
  addrsub    = ["10.0.12.0/24"]
}

module "azpublicip1" {
  source  = "../../modules/azure_publicip"
  pipname = "devpip010901"
  rgname  = module.azrg.azurermrg
  loc     = "japaneast"
}

module "azpublicip2" {
  source  = "../../modules/azure_publicip"
  pipname = "devpip010902"
  rgname  = module.azrg.azurermrg
  loc     = "japaneast"
}

module "aznic1" {
  source   = "../../modules/azure_nic"
  nicname  = "devnic010901"
  subnetid = module.azsubnet1.azurermsubnet
  rgname   = module.azrg.azurermrg
  loc      = "japaneast"

}

module "aznic2" {
  source   = "../../modules/azure_nic"
  nicname  = "devnic010902"
  subnetid = module.azsubnet2.azurermsubnet
  rgname   = module.azrg.azurermrg
  loc      = "japaneast"
}

module "aznsg1" {
  depends_on = [module.aznic1]
  source     = "../../modules/azure_nsg"
  nsgname    = "devnsg010901"
  rgname     = module.azrg.azurermrg
  loc        = "japaneast"
}

module "aznsg2" {
  depends_on = [module.aznic2]
  source     = "../../modules/azure_nsg"
  nsgname    = "devnsg010902"
  rgname     = module.azrg.azurermrg
  loc        = "japaneast"
}

module "aznicnsg1" {
  source = "../../modules/azure_nic_nsg"
  nicid  = module.aznic1.azurermnic
  nsgid  = module.aznsg1.azurermnsg
}

module "aznicnsg2" {
  source = "../../modules/azure_nic_nsg"
  nicid  = module.aznic2.azurermnic
  nsgid  = module.aznsg2.azurermnsg
}

module "azbastion" {
  source      = "../../modules/azure_bastion"
  bastionname = "devbastion0109"
  pipid       = module.azpublicip1.azurermpip
  subnetid    = module.azsubnetbastian.azurermsubnet
  rgname      = module.azrg.azurermrg
  loc         = "japaneast"
}

module "azlb" {
  source = "../../modules/azure_loadbalancer"
  lbname = "devlb0109"
  pipid  = module.azpublicip2.azurermpip
  rgname = module.azrg.azurermrg
  loc    = "japaneast"
}

module "azkvscret" {
  source     = "../../modules/azure_key_vault_secret"
  secretname = "adminuser"
  secretpswd = "Pamanu2friends%"
}

module "azvm1" {
  depends_on = [module.aznicnsg1]
  source     = "../../modules/azure_vm"
  vmname     = "devvm010901"
  nicid      = [module.aznic1.azurermnic]
  username   = "adminuser"
  password   = "Pamanu2friends%"
  rgname     = module.azrg.azurermrg
  loc        = "japaneast"
}

module "azvm2" {
  depends_on = [module.aznicnsg2]
  source     = "../../modules/azure_vm"
  vmname     = "devvm010902"
  nicid      = [module.aznic2.azurermnic]
  username   = "adminuser"
  password   = "Pamanu2friends%"
  rgname     = module.azrg.azurermrg
  loc        = "japaneast"
}
