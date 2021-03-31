data "azurerm_resource_group" "app_service_rg" {
  name     = var.rg_name
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.asp_name
  location            = data.azurerm_resource_group.app_service_rg.location
  resource_group_name = data.azurerm_resource_group.app_service_rg.name

  sku {
    tier = var.asp_tier
    size = var.asp_size
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = data.azurerm_resource_group.app_service_rg.location
  resource_group_name = data.azurerm_resource_group.app_service_rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  app_settings = var.app_settings

  site_config {
    use_32_bit_worker_process =false
    dotnet_framework_version = "v5.0"
    default_documents=[
      "Default.htm",
      "Default.html",
      "Default.asp",
      "index.htm",
      "index.html",
      "iisstart.htm",
      "default.aspx",
      "index.php",
      "hostingstart.html",
    ]
    local_mysql_enabled = var.mysql_in_app
    scm_type = var.scm_type
  }
  

  dynamic "connection_string" {
    for_each=var.connection_strings
    content {
      name = connection_string.value["name"]
      type = connection_string.value["type"]
      value = connection_string.value["value"]
    }
  }

  
}