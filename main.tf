data "azurerm_subscription" "current" {}

provider "azurerm" {

  features {}
}

######################------Storage account-----###############################
resource "azurerm_resource_group" "resource_group01" {
  name     = var.resource_group.name
  location = var.resource_group.location
  tags     = local.app_ops_tags
}

module "terraform_storage_account" {
  source = "./modules/storage/storage-account"

  storage_account_name = var.terraform_backend.storage_account_name
  location             = azurerm_resource_group.resource_group01.location
  resource_group_name  = azurerm_resource_group.resource_group01.name
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.terraform_backend.storage_container_name
  storage_account_name  = module.terraform_storage_account.storage_account.name
  container_access_type = var.terraform_backend.storage_container_access_type
}

######################------Static website-----###############################


resource "azurerm_static_site" "gatsby_static_website" {
  depends_on = [

    azurerm_resource_group.resource_group01
  ]
  name                = "super-specials-alokk-coles"
  resource_group_name = azurerm_resource_group.resource_group01.name
  location            = "eastasia"
  sku_tier            = "Free"
  sku_size            = "Free"

}

resource "azurerm_dns_cname_record" "static_website_dns" {
  depends_on = [

    azurerm_resource_group.resource_group01
  ]
  name                = "super-specials"
  zone_name           = "super-specials-alokk.com"
  resource_group_name = azurerm_resource_group.resource_group01.name
  ttl                 = 300
  record              = azurerm_static_site.gatsby_static_website.default_host_name
}


######################------Vnet and subnet-----###############################
/*
module "terraform_virtual_network" {
  depends_on = [

    azurerm_resource_group.terraform_backend
  ]
  source                      = "./modules/networking/vnet-subnet"
  virtual_network_name        = var.virtual_network.virtual_network_name
  location                    = azurerm_resource_group.terraform_backend.location
  resource_group_name         = azurerm_resource_group.terraform_backend.name
  address_space               = ["10.10.1.0/24"]
  network_security_group_name = var.virtual_network.subnets.network_security_group_name
  subnet_name                 = var.virtual_network.subnets.subnet_name
  address_prefixes            = ["10.10.1.0/27"]

}
*/