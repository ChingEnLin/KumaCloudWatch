# Define the provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.103.1"
    }
  }

  required_version = ">= 1.1.0"
}
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create a storage account and configure file share
resource "azurerm_storage_account" "storage_acc" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  depends_on = [azurerm_resource_group.rg]
}
resource "azurerm_storage_share" "fs" {
  name                 = var.storage_share_name
  storage_account_name = azurerm_storage_account.storage_acc.name
  quota                = 50

  access_tier = "Hot"

  depends_on = [azurerm_storage_account.storage_acc]
}

# Create service plan and web service
resource "azurerm_service_plan" "sp" {
  name                = var.service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_linux_web_app" "web_app" {
  name                = var.web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  service_plan_id     = azurerm_service_plan.sp.id
  https_only          = true

  site_config {
    always_on           = true
    websockets_enabled  = true
    http2_enabled       = true
    minimum_tls_version = "1.2"

    application_stack {
      docker_image_name   = "louislam/uptime-kuma:latest"
      docker_registry_url = "https://index.docker.io"
    }
  }

  app_settings = {
    "DOCKER_ENABLE_CI" = "true"
  }

  storage_account {
    name         = azurerm_storage_account.storage_acc.name
    account_name = azurerm_storage_account.storage_acc.name
    type         = "AzureFiles"
    share_name   = azurerm_storage_share.fs.name
    access_key   = azurerm_storage_account.storage_acc.primary_access_key
    mount_path   = "/app/data"
  }

  depends_on = [azurerm_service_plan.sp]
}