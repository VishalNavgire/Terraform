#In Terraform, the outputs.tf file is used to expose information about your resources to the command line, 
#to other independent Terraform configurations, or to your CI/CD pipeline.

output "resource_group_name" {
  description = "The name of the created lifecycle resource group."
  value       = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  description = "The provisioned public IP address of the environment VM."
  value       = azurerm_public_ip.pip.ip_address
}

output "virtual_machine_private_ip" {
  description = "The internal private IP address of the network interface."
  value       = azurerm_network_interface.nic.private_ip_address
}

output "virtual_network_id" {
  description = "The fully qualified resource ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}