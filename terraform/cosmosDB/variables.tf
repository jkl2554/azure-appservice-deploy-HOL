variable "rg_name"{
    type = string
    default = "cosmosDB-RG"
    description = "Cosmos DB resource Group"
}
variable "cosmosdb_name"{
    type = string
    default = "hyugocosmosdb"
    description = "Cosmos DB name"
}
variable "cosmosdb_dbname"{
    type = string
    default = "Todos"
    description = "Cosmos DB Database name"
}
variable "cosmosdb_container_name"{
    type = string
    default = "Todos_container"
    description = "Cosmos DB Container name"
}
variable "cosmosdb_container_partition_key"{
    type = string
    default = "/_id"
    description = "partition key dir"
}