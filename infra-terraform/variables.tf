variable "project_name" {
  type        = string
  default     = "edenred-devops-bilal"
}

variable "azure_subscription_id" {
  type        = string
  description = "Subscription id for deployment to Azure Cloud"
  sensitive   = true
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