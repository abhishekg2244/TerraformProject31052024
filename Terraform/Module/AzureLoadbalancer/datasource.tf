data "azurerm_virtual_network" "datablockvnet" {
    for_each = var.m_loadbalancer
  name                = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_public_ip" "datablockpip" {
  for_each = var.m_loadbalancer
  name =each.value.datapublic
  resource_group_name = each.value.resource_group_name
}