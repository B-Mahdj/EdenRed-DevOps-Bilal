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