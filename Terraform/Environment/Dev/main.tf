module "resource_group" {
  source = "../../Module/Resourcegroup"
  m_resource_group_name = var.resource_group_name
  m_resource_group_location = var.resource_group_location
}

module "storage_account" {
    depends_on = [ module.resource_group ]
  source = "../../Module/Stroageaccount"
  m_storage_account = var.storageaccount
}

module "virtual_network" {
    depends_on = [ module.resource_group ]
  source = "../../Module/Virtualnetwork"
  m_virtualnetwork = var.virtualnetwork
}

module "subnet" {
depends_on = [ module.resource_group,module.virtual_network ]
source = "../../Module/Subnet"
m_subnet = var.subnet
}

module "virtual_machine" {
depends_on = [ module.resource_group,module.virtual_network,module.subnet ]
source = "../../Module/Virtualmachine"
m_virtualmachine = var.virtualmachine
}



module "publicip" {
  depends_on = [ module.resource_group ]
  source = "../../Module/Publicip"
  m_publicip = var.publicipvariable
  
}

module "bastion" {
  depends_on = [ module.resource_group,module.virtual_machine,module.subnet,module.publicip ]
  source = "../../Module/Azurebastion"
  m_bastionvariable = var.bastionvariable
  
}



module "load_balancer" {
depends_on = [ module.resource_group,module.virtual_machine,module.virtual_network,module.publicip ]
source = "../../Module/AzureLoadbalancer"
m_loadbalancer = var.loadbalancer
  
}