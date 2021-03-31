resource "azurerm_resource_group" "App_rg"{
    name = var.appservice_rg
    location = var.location
}

resource "azurerm_resource_group" "DB_rg" {
    name = var.db_rg_name
    location = var.location
}

module "azuresqldb" {
    count  = (var.DB_type == "SQLAzure" ? 1:0)
    depends_on = [azurerm_resource_group.DB_rg]
    source = "./sql_database"
    providers = {
        azurerm = azurerm
    }
    azure_sql_rg=azurerm_resource_group.DB_rg.name
    azure_sql_server_name=var.dbserver_name
    azure_sql_admin_username=var.azuresql_admin_username
    azure_sql_admin_password=var.azuresql_admin_password
    azure_sql_db=var.dbname

    azure_sql_version="12.0"
    azure_sql_db_size_gb=2
    azure_sql_db_sku="basic"

}

module "cosmosdb" {
    count  = (var.DB_type == "CosmosDB"? 1:0)
    depends_on = [azurerm_resource_group.DB_rg]
    source = "./cosmosDB"
    providers = {
        azurerm = azurerm
    }
    rg_name = azurerm_resource_group.DB_rg.name


    cosmosdb_name = var.dbserver_name
    cosmosdb_dbname = var.dbname
    cosmosdb_container_name = var.cosmosdb_container_name
    cosmosdb_container_partition_key = var.cosmosdb_partition_key
}

module "app_service" {
    source = "./app_service"
    depends_on = [azurerm_resource_group.App_rg]
    providers = {
        azurerm = azurerm
    }
    rg_name = azurerm_resource_group.App_rg.name

    asp_name=var.asp_name
    asp_tier=var.asp_tier
    asp_size=var.asp_size
    app_service_name=var.appservice_name
    app_settings={
        "ASPNETCORE_ENVIRONMENT" = var.env
        "Provider" = var.DB_type
        "Container" = var.cosmosdb_container_name
        "DBName" = var.dbname
    }


    scm_type = var.scm_type

    connection_strings=[
        {
            name = var.dbname
            type = (var.DB_type == "CosmosDB"? "Custom" : var.DB_type)
            value = (var.DB_type == "CosmosDB"? module.cosmosdb[0].connection_string : module.azuresqldb[0].connection_string)
        }
    ]
}