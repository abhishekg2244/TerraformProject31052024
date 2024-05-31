data "azurerm_public_ip" "datapipbastion" {
    for_each = var.m_bastionvariable
  name                = each.value.bastionpublicip
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "datablocksubnet" {
    for_each = var.m_bastionvariable
  name                 = each.value.bastionsubnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}