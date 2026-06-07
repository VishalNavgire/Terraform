output "automation_account_name" {

  value = azurerm_automation_account.aa.name

}

output "resource_group_name" {

  value = azurerm_resource_group.rg.name

}

output "runbooks_created" {

  value = {

    for rb in azurerm_automation_runbook.runbooks :

    rb.name => {

      id   = rb.id
      type = rb.runbook_type

    }

  }

}