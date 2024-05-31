

resource "azurerm_lb" "lbblock" {
    for_each = var.m_loadbalancer
  name                = "TestLoadBalancer"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku = each.value.sku

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.datablockpip[each.key].id
  }
}


resource "azurerm_lb_backend_address_pool" "backendpoolblock" {
    for_each = var.m_loadbalancer
  loadbalancer_id = azurerm_lb.lbblock[each.key].id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_backend_address_pool_address" "example" {
  for_each = var.m_loadbalancer
  name                    = "frontendvm1-backendpool"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendpoolblock[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.datablockvnet[each.key].id
  ip_address              = "10.0.1.4"
}

resource "azurerm_lb_backend_address_pool_address" "adresspoolblock" {
    for_each = var.m_loadbalancer
  name                    = "frontendvm2-backendpool"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendpoolblock[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.datablockvnet[each.key].id
  ip_address              = "10.0.1.5"
}

resource "azurerm_lb_probe" "probeblock" {
    for_each = var.m_loadbalancer
  loadbalancer_id = azurerm_lb.lbblock[each.key].id
  name            = "ssh-running-probe"
  port            = 22
}

resource "azurerm_lb_rule" "example" {
    for_each = var.m_loadbalancer
 loadbalancer_id = azurerm_lb.lbblock[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id = azurerm_lb_probe.probeblock[each.key].id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.backendpoolblock[each.key].id]
}