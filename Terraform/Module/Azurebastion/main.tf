

resource "azurerm_bastion_host" "example" {
    for_each = var.m_bastionvariable
  name                = each.value.bastionname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "bastionip"
    subnet_id            = data.azurerm_subnet.datablocksubnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.datapipbastion[each.key].id
  }
}