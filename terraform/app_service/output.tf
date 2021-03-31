output "site_hostname"{
    value = azurerm_app_service.app_service.default_site_hostname
}
output "git_info"{
    value = azurerm_app_service.app_service.source_control
}
output "user_name" {
    value = azurerm_app_service.app_service.site_credential.0.username
}
output "password" {
    value = azurerm_app_service.app_service.site_credential.0.password
    sensitive = true
}