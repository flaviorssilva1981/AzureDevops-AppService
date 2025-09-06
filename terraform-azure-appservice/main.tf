module "rg" {
  source   = "./modules/resource_group"
  name     = var.resource_group
  location = var.location
}

module "asp" {
  source              = "./modules/service_plan"
  name                = var.asp_name
  location            = module.rg.location
  resource_group_name = module.rg.name
  os_type             = "Windows"
  sku_name            = var.asp_sku
}

module "law" {
  source              = "./modules/log_analytics"
  name                = coalesce(var.log_analytics_name, "law-${var.app_name}")
  location            = module.rg.location
  resource_group_name = module.rg.name
  tags                = var.tags
}

module "appi" {
  source              = "./modules/app_insights"
  name                = coalesce(var.app_insights_name, "appi-${var.app_name}")
  location            = module.rg.location
  resource_group_name = module.rg.name
  workspace_id        = module.law.id
  tags                = var.tags
}

module "app" {
  source              = "./modules/app_service"
  name                = var.app_name
  location            = module.rg.location
  resource_group_name = module.rg.name
  service_plan_id     = module.asp.id
  runtime             = "DOTNETCORE|8.0"
  app_settings = {
    APPLICATIONINSIGHTS_CONNECTION_STRING = module.appi.connection_string
    APPLICATIONINSIGHTS_INSTRUMENTATIONKEY = module.appi.instrumentation_key
    APPINSIGHTS_PROFILERFEATURE_VERSION    = "1.0.0"
    APPINSIGHTS_SNAPSHOTFEATURE_VERSION    = "1.0.0"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
  }
  tags                = var.tags
}
