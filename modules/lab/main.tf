resource "random_string" "virtual_machine_name" {
  length  = 9
  upper   = true
  special = false
  numeric = false
}

resource "random_password" "password" {
  length      = 8
  special     = true
  min_numeric = 1
  min_upper   = 1
  min_lower   = 1
  min_special = 1
}

resource "azurerm_dev_test_linux_virtual_machine" "virtual_machine" {
  name                   = "z${random_string.virtual_machine_name.result}"
  lab_name               = var.lab_name
  lab_subnet_name        = var.lab_subnet_name
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  storage_type           = "Standard"
  size                   = var.virtual_machine_size
  username               = var.username
  password               = random_password.password.result
  allow_claim            = false
  lab_virtual_network_id = var.lab_vnet_id

  gallery_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
