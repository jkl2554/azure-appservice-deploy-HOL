variable "azure_sql_rg"{
    type= string
    default = "sql-rg"
    description = "sql db rg"
}
variable "azure_sql_server_name"{
    type = string
    default = "hyugosql"
    description = "SQL Server Name"
}
variable "azure_sql_version"{
    type = string
    default = "12.0"
    description = "SQL Server Version"
}
variable "azure_sql_admin_username"{
    type = string
    default = "azureuser"
    description = "admin username"
}
variable "azure_sql_admin_password"{
    type = string
    default = "qwer1234!@#$"
    description = "admin password"
}
variable "azure_sql_db"{
    type = string
    default = "Todos"
    description = "SQL database name"
}
variable "azure_sql_db_size_gb"{
    type = number
    default = 2
    description="DB size"
}

variable "azure_sql_db_sku"{
    type = string
    default = "Basic"
    description = "Database Sku"
}