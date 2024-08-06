resource "azurerm_app_service_plan" "swa" {
  name                = "dang12394-asp"
  location            = azurerm_resource_group.swa.location
  resource_group_name = azurerm_resource_group.swa.name
  kind                = "App"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
    capacity = 1
  }
}

resource "azurerm_app_service" "swa" {
  name                = "dang12394"
  location            = azurerm_resource_group.swa.location
  resource_group_name = azurerm_resource_group.swa.name
  app_service_plan_id = azurerm_app_service_plan.swa.id
  site_config {
    linux_fx_version = "DOTNETCORE|8.0"
  }
  app_settings = {
    ASPNETCORE_ENVIRONMENT = "Development",
    UseOnlyInMemoryDatabase = "false"
  }
}