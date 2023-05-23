resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.region
}

data "azurerm_storage_account" "example" {
  name                = "packerimages"
  resource_group_name = "packer-storage"
}

output "storage_account_tier" {
  value = data.azurerm_storage_account.example.account_tier
}

data "azurerm_storage_container" "example" {
  name                 = "example-container-name"
  storage_account_name = "example-storage-account-name"
}

resource "azurerm_storage_blob" "example" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = var.storage_blob_source
}