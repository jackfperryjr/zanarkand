# outputs from the module
# these values can be referenced in other modules
# or resource and data calls
output "virtual_machine_name" {
  value = azurerm_dev_test_linux_virtual_machine.virtual_machine.name
}

output "username" {
  value = azurerm_dev_test_linux_virtual_machine.virtual_machine.username
}

output "password" {
  sensitive = true
  value     = random_password.password.result
}
