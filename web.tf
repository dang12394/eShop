resource "azurerm_service_plan" "swa" {
  name                = "dang12394-asp"
  location            = azurerm_resource_group.swa.location
  resource_group_name = azurerm_resource_group.swa.name
  sku_name            = "F1"
  os_type             = "Windows"

}

resource "azurerm_windows_web_app" "swa" {
  name                = "dang12394"
  location            = azurerm_resource_group.swa.location
  resource_group_name = azurerm_resource_group.swa.name
  service_plan_id = azurerm_service_plan.swa.id
  site_config {
    application_stack {
      current_stack = "dotnetcore"
      dotnet_version = "v8.0"
    }
    always_on = false
  }
  app_settings = {
    ASPNETCORE_ENVIRONMENT = "Development",
    UseOnlyInMemoryDatabase = "true"
  }
  connection_string {
    name = "catalogDB"
    type = "SQLAzure"
    value = output.db_string.value
  }
}