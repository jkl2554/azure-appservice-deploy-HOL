output "connection_string"{
    value = format("Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",azurerm_sql_server.azure_sql.fully_qualified_domain_name,azurerm_mssql_database.azure_sql_db.name,azurerm_sql_server.azure_sql.administrator_login,azurerm_sql_server.azure_sql.administrator_login_password)
}
