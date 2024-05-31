resource_group_name = {
    rg1 = {
        name = "RGmaywesteuropeprod01"
    }
}

resource_group_location = "westeurope"


#### storage account details ###### 
    

storageaccount = {
   sa1 ={
  name                     = "samay31account"
  resource_group_name      = "RGmaywesteuropeprod01"
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "GRS"    
    }
}

#### Virtual network details #######

virtualnetwork = {
  vnet1 ={
   name                = "devvnet1"
  location            = "westeurope"
  resource_group_name = "RGmaywesteuropeprod01"
  address_space       = ["10.0.0.0/16"] 
  }
}
#### subnet detials ############
subnet = {
  subnet1 = {
  name                 = "frontendsubnet"
  resource_group_name  = "RGmaywesteuropeprod01"
  virtual_network_name = "devvnet1"
  address_prefixes     = ["10.0.1.0/24"]  
  }

  subnet2 = {
  name                 = "backendsubnet"
  resource_group_name  = "RGmaywesteuropeprod01"
  virtual_network_name = "devvnet1"
  address_prefixes     = ["10.0.2.0/24"]  
  }

  subnet3 = {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "RGmaywesteuropeprod01"
  virtual_network_name = "devvnet1"
  address_prefixes     = ["10.0.0.32/27"]  
  }
}

#### Linux virtual machine #####
virtualmachine = {
  linuxvm1 ={
  vmname                = "frontendvm1"
  vmnic               = "forntendvm1-nic"
  location            = "westeurope"
  resource_group_name = "RGmaywesteuropeprod01"
  datafromsubnet= "frontendsubnet"
  virtual_network_name = "devvnet1"
  }
  
   linuxvm2 ={
  vmname                = "frontendvm2"
  vmnic               = "forntendvm2-nic"
  location            = "westeurope"
  resource_group_name = "RGmaywesteuropeprod01"
  datafromsubnet= "frontendsubnet"
  virtual_network_name = "devvnet1"
  }
}

#### Loadbalancer #######
loadbalancer = {
  lb1 ={
    lbname     = "TestLoadBalancer"
    lbublicip = "PublicIPForLB"
    resource_group_name   = "RGmaywesteuropeprod01"
    location              = "westeurope"
    sku = "Standard"
    allocation_method   = "Static"
    virtual_network_name = "devvnet1"
    datapublic = "lbpublicip"
    
  }
}

###### Public Ip ######
publicipvariable = {
  publicip1 ={
    
  name                = "bastionpublicip"
  resource_group_name   = "RGmaywesteuropeprod01"
  location              = "westeurope"
  allocation_method   = "Static"
  sku                 = "Standard"

  }

    publicip2 ={
    
  name                = "lbpublicip"
  resource_group_name   = "RGmaywesteuropeprod01"
  location              = "westeurope"
  allocation_method   = "Static"
  sku                 = "Standard"

  }
}

###### Bastion variable #####
 bastionvariable = {
  bastion1 ={
  bastionpublicip = "bastionpublicip"
  location            = "westeurope"
  resource_group_name = "RGmaywesteuropeprod01"
  virtual_network_name = "devvnet1"
  bastionsubnet = "AzureBastionSubnet"
  bastionname = "jumpserver1"
  }

  
}