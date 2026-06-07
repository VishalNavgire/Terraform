variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "West Europe"
}

variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "dev"
}

variable "runbooks" {
  description = "Runbook Configuration"

  type = list(object({

    name         = string
    description  = string
    runbook_type = string
    file_content = string

  }))
}