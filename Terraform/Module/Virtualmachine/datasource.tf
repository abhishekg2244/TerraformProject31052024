data "azurerm_subnet" "datablocksubnet" {
    for_each = var.m_virtualmachine
  name                 = each.value.datafromsubnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}