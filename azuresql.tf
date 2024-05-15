resource "azurerm_resource_group" "francisco_sql" {
  name     = "database-rg"
  location = "Canada Central"
}

resource "azurerm_mssql_server" "francisco_sql" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.francisco_sql.name
  location                     = azurerm_resource_group.francisco_sql.location
  version                      = "12.0"
  administrator_login          = "francisco_admin"
  administrator_login_password = "Monica,127"
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = {
    environment = "production"
  }
}
