variable "DB_type"{
    type = string
    default = "SQLAzure"
    description = "Database Type"
}
variable "location"{
    type = string
    default = "Korea Central"
    description = "Location of Resource"
}
variable "db_rg_name"{
    type =string
    default = "Database-RG"
    description = "DB RG"
}
variable "dbserver_name"{
    type =string
    default = ""
    description = "DB Server Name"
}
variable "azuresql_admin_username"{
    type =string
    default = "azureuser"
    description = "DB admin username"
}
variable "azuresql_admin_password"{
    type =string
    default = "qwer1234!@#$"
    description = "DB admin Password"
}
variable "dbname"{
    type =string
    default = "Todos"
    description = "databasename"
}
variable "cosmosdb_container_name"{
    type =string
    default = "Todos_container"
    description = "CosmosDB container name"
}
variable "cosmosdb_partition_key"{
    type =string
    default = "/_todos_key"
    description = "partition key"
}
variable "appservice_rg"{
    type =string
    default = "App-RG"
    description = "App Service RG"
}
variable "asp_name"{
    type =string
    default = "HOL-plan"
    description = "app service plan"
}
variable "asp_tier"{
    type =string
    default = "PremiumV3"
    description = "plan Tier"
}
variable "asp_size"{
    type =string
    default = "P1v3"
    description = "size"
}
variable "appservice_name"{
    type =string
    default = ""
    description = "Appservice name"
}
variable "env"{
    type =string
    default = "Development"
    description = "Appliation environment"
}
variable "scm_type"{
    type =string
    default = "None"
    description = "Deploy app git type"
}