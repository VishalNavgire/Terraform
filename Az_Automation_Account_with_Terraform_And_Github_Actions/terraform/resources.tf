#Resource Gorup

resource "azurerm_resource_group" "rg" {

  name     = "rg-${local.project_name}-${var.environment}"
  location = var.location

  tags = local.common_tags

}

#Automation Account

resource "azurerm_automation_account" "aa" {

  name                = "aa-${local.project_name}-${var.environment}"

  location            = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  sku_name            = "Basic"

  tags = local.common_tags

}

#Runbooks

resource "azurerm_automation_runbook" "runbooks" {

  for_each = {

    for rb in var.runbooks :

    rb.name => rb

  }

  name                    = each.value.name

  location                = azurerm_resource_group.rg.location

  resource_group_name     = azurerm_resource_group.rg.name

  automation_account_name = azurerm_automation_account.aa.name

  log_verbose             = true

  log_progress            = true

  description             = each.value.description

  runbook_type            = each.value.runbook_type

  content = file(each.value.file_content)

}