provider "azurerm" {
  version = "3.0.0"
  features {}
}

resource "azurerm_resource_group" "tfrg_test" {
  name     = "tf-container-rg"
  location = "westeurope"
}

resource "azurerm_container_group" "tfcg_test" {
  name                = "weatherapi"
  location            = azurerm_resource_group.tfrg_test.location
  resource_group_name = azurerm_resource_group.tfrg_test.name

  ip_address_type = "Public"
  dns_name_label  = "h44tle"
  os_type         = "Linux"

  container {
    name   = "weatherapi"
    image  = "h44tle/weatherapi"
    cpu    = "1"
    memory = "1"

    ports {
      protocol = "TCP"
      port     = 80
    }
  }
}
