resource "azurerm_service_plan" "asp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_name
}

output "id" {
  value = azurerm_service_plan.asp.id
}
