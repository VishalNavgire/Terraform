variable "environment_name" {}
variable "location"         {}
variable "vnet_cidr"        {}
variable "subnet_cidr"      {}
variable "vm_size"          {}
variable "admin_password"   {}

module "infrastructure_tier" {
  source           = "../../modules/environment_tier"
  environment_name = var.environment_name
  location         = var.location
  vnet_cidr        = var.vnet_cidr
  subnet_cidr      = var.subnet_cidr
  vm_size          = var.vm_size
  admin_password   = var.admin_password
}