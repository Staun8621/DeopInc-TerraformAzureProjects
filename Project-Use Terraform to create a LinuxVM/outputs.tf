# outputs the resource group name
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# outputs public IP address
output "public_ip_address" {
  value = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
}

# outputs the tls_private_key
output "tls_private_key" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true
}