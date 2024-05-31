variable "resource_group_name" {
   type = map(any)
}

variable "resource_group_location" {
    type = string
  }

variable "storageaccount" {
    type = map(any)
}

variable "virtualnetwork" {
   type = map(any)
}

variable "subnet" {
   type = map(any)
}

variable "virtualmachine" {
   type = map(any)
}


variable "loadbalancer" {
  type = map(any)
}

variable "bastionvariable" {
  type = map(any)
}

variable "publicipvariable" {
  type = map(any)
}