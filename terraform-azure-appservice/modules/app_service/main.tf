resource "azurerm_windows_web_app" "app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  site_config {
    application_stack {
      current_stack  = "dotnetcore"
      dotnet_version = "v8.0"
    }
  }

  app_settings = var.app_settings

  tags = var.tags
}

output "default_hostname" {
  value = azurerm_windows_web_app.app.default_hostname
}
