resource "azurerm_resource_group" "zanarkand_lab_eastus2_rg" {
  name     = "${var.lab_name}-${var.region}-lab-rg"
  location = var.region
}

resource "azurerm_dev_test_lab" "zanarkand_lab_eastus2" {
  name                = "zanarkand"
  location            = azurerm_resource_group.zanarkand_lab_eastus2_rg.location
  resource_group_name = azurerm_resource_group.zanarkand_lab_eastus2_rg.name
}

resource "azurerm_dev_test_virtual_network" "zanarkand_lab_eastus2_vnet" {
  name                = "${var.lab_name}-${var.region}-lab-vnet"
  lab_name            = azurerm_dev_test_lab.zanarkand_lab_eastus2.name
  resource_group_name = azurerm_resource_group.zanarkand_lab_eastus2_rg.name

  subnet {
    use_public_ip_address           = "Allow"
    use_in_virtual_machine_creation = "Allow"
  }
}

module "lab" {
  source   = "./modules/lab"
  for_each = { for user in local.user_json.users: user.username => user }

  region                  = var.region
  lab_name                = "zanarkand"
  lab_vnet_id             = azurerm_dev_test_virtual_network.zanarkand_lab_eastus2_vnet.id
  resource_group_name     = azurerm_resource_group.zanarkand_lab_eastus2_rg.name
  resource_group_location = var.region
  username                = each.value.username
  virtual_machine_size    = "B"
  lab_subnet_name         = azurerm_dev_test_virtual_network.zanarkand_lab_eastus2_vnet.subnet[0].name
}

resource "local_file" "user_credentials" {
  content = jsonencode({
    "credentials": [for vm in module.lab : "${vm.username}:${vm.password}"]
  })
  filename = "${path.module}/creds.json"
}
