variable "project_name" {
  type        = string
  default     = "edenred-devops-bilal"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Région Azure"
}

variable "image_url" {
  description = "URL of the image"
  type        = string
  default     = "ghcr.io/b-mahdj/dotnet-app:latest"
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "azure_client_id" {
  description = "Azure Client (Application) ID"
  type        = string
  sensitive   = true
}

variable "azure_client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}