data "azurerm_resource_group" "azure_sql_rg"{
  name = var.azure_sql_rg
}

##################      Database      #################


resource "azurerm_sql_server" "azure_sql" {
  name                         = var.azure_sql_server_name
  resource_group_name          = data.azurerm_resource_group.azure_sql_rg.name
  location                     = data.azurerm_resource_group.azure_sql_rg.location
  administrator_login          = var.azure_sql_admin_username
  administrator_login_password = var.azure_sql_admin_password
  version                      = var.azure_sql_version
}

resource "azurerm_sql_firewall_rule" "AllowAllWindowsAzureIps" {
  name                = "AllowAllWindowsAzureIps"
  resource_group_name = data.azurerm_resource_group.azure_sql_rg.name
  server_name         = azurerm_sql_server.azure_sql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_mssql_database" "azure_sql_db" {
  name           = var.azure_sql_db
  server_id      = azurerm_sql_server.azure_sql.id
  max_size_gb    = var.azure_sql_db_size_gb
  read_scale     = false
  sku_name       = var.azure_sql_db_sku
  zone_redundant = false
}