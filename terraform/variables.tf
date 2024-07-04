# Purpose: Define the variables that will be used in the terraform configuration

variable "location" {
  description = "Location of the resources"
  type        = string
  default     = "germanywestcentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-kuma-watcher"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "kumawatcherstorageacc"
}

variable "storage_share_name" {
  description = "Name of the storage share"
  type        = string
  default     = "kumawatcherstorageshare"
}

variable "service_plan_name" {
  description = "Name of the service plan"
  type        = string
  default     = "kumawatcherserviceplan"
}

variable "web_app_name" {
  description = "Name of the web app"
  type        = string
}