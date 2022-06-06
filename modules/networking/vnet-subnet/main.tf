terraform {
  required_version = "~> 1.1.0"
}

 #Vnet
resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
   
    tags = merge(
    {
      Name = var.virtual_network_name
    },
    var.custom_tags
  )

}
 # Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}

# NSG
resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  resource_group_name = var.resource_group_name
  location            = var.location
}


