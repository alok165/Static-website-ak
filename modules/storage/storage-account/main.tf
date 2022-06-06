terraform {
  required_version = "~> 1.1.0"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = merge(
    {
      Name = var.storage_account_name
    },
    var.custom_tags
  )
}
