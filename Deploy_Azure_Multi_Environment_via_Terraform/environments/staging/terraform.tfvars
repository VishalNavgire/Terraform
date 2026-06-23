# Note: admin_password will be injected via environmental TF_VAR variables in CI/CD pipeline
environment_name = "staging"
location         = "East US"
vnet_cidr        = "10.30.0.0/16"
subnet_cidr      = "10.30.1.0/24"
vm_size          = "Standard_B2s"
