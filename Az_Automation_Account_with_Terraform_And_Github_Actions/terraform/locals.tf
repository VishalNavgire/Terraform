locals {

  project_name = "automation"

  common_tags = {

    Environment = var.environment
    ManagedBy   = "Terraform"
    Repository  = "Azure-Automation-Runbooks"

  }

}