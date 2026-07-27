output "resource_group_name" {
  description = "Resource group name."
  value       = azurerm_resource_group.lab.name
}

output "resource_group_id" {
  description = "Resource group ID."
  value       = azurerm_resource_group.lab.id
}

output "virtual_network_id" {
  description = "Virtual network ID."
  value       = azurerm_virtual_network.lab.id
}

output "subnet_id" {
  description = "Subnet ID."
  value       = azurerm_subnet.lab.id
}

output "network_security_group_id" {
  description = "Network security group ID."
  value       = azurerm_network_security_group.lab.id
}

output "storage_account_name" {
  description = "Storage account name."
  value       = azurerm_storage_account.lab.name
}

output "storage_account_id" {
  description = "Storage account ID."
  value       = azurerm_storage_account.lab.id
}
