data "azurerm_resource_group" "cosmosdb_rg" {
  name     = var.rg_name
}

resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                = var.cosmosdb_name
  location            = data.azurerm_resource_group.cosmosdb_rg.location
  resource_group_name = data.azurerm_resource_group.cosmosdb_rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = false
  public_network_access_enabled =true

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }
  geo_location {
    location          = data.azurerm_resource_group.cosmosdb_rg.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmosdb_database" {
  name                = var.cosmosdb_dbname
  resource_group_name = azurerm_cosmosdb_account.cosmosdb_account.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmosdb_account.name
  throughput          = 400
}

resource "azurerm_cosmosdb_sql_container" "cosmosdb_container" {
  name                  = var.cosmosdb_container_name
  resource_group_name   = azurerm_cosmosdb_account.cosmosdb_account.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb_account.name
  database_name         = azurerm_cosmosdb_sql_database.cosmosdb_database.name
  partition_key_path    = var.cosmosdb_container_partition_key
  throughput            = 400
}