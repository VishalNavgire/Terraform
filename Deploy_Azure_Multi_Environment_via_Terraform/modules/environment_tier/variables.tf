variable "environment_name" { 
    type = string 
    }
variable "location"         { 
    type = string
    default = "East US" 
    }
variable "vnet_cidr"        { 
    type = string 
}
variable "subnet_cidr"      { 
    type = string 
    }
variable "vm_size"          { 
    type = string
    default = "Standard_B2s" 
    }
variable "admin_password"   { 
    type = string
    sensitive = true 
    }