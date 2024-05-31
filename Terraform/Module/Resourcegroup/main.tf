resource "azurerm_resource_group" "example" {
   for_each = var.m_resource_group_name
   name =each.value.name
   location = var.m_resource_group_location

}