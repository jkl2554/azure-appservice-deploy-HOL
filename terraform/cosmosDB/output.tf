output "connection_string"{
    value = azurerm_cosmosdb_account.cosmosdb_account.connection_strings[0]
}

output "database_name"{
    value = azurerm_cosmosdb_sql_database.cosmosdb_database.name
}

output "continer_name"{
    value = azurerm_cosmosdb_sql_container.cosmosdb_container.name
}