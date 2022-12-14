# Network Cloud Azure module in Terraform, for the use of the following resources

Network Module in Terraform for the creation of Network and Security Resources.

## list of resources that you can deploy with the network cloud azure module

```
- Resoruce Group
- VNET 
- DDOS Proctetions Plan
- Network Security Group
- Peering
```

### Module Settings

```
- Subnets 
- Network segments
- DNS Servers 
- Tags Projects 
```

By deploying the network module, we can have the ability to create the VNet and SubNets, as well as activate protection with DDOS Protection and Network Security Group.

Architecture diagram of the Azure cloud network module implemented

![Image text](https://github.com/magnetoxx24/infrastructure_as_code_terraform/blob/master/cloud/azure/diagram/Diagram%20Module%20Network%20Cloud%20Azure%20Magnetoxx24-Network.jpg)

## To deploy the resources using the network module, you can use the following commands to be able to deploy by type of environment

# Environment Development

```
terraform init
terraform plan  --var-file="environment/development/dev.tfvars.json"
terraform apply --var-file="environment/development/dev.tfvars.json"
```
```hcl
❯ terraform plan  --var-file="environment/development/dev.tfvars.json"

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "eastus2"
      + name     = "M24-AZ-NETWORKING-EASTUS2-DEV-001"
      + tags     = {
          + "Ambiente"    = "DEV"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
    }

  # module.network.azurerm_network_ddos_protection_plan.ddospp will be created
  + resource "azurerm_network_ddos_protection_plan" "ddospp" {
      + id                  = (known after apply)
      + location            = "eastus2"
      + name                = "M24-AZ-DDOS-EASTUS2-DEV-001"
      + resource_group_name = "M24-AZ-NETWORKING-EASTUS2-DEV-001"
      + tags                = {
          + "Ambiente"    = "DEV"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
      + virtual_network_ids = (known after apply)
    }

  # module.network.azurerm_network_security_group.nsg will be created
  + resource "azurerm_network_security_group" "nsg" {
      + id                  = (known after apply)
      + location            = "eastus2"
      + name                = "M24-AZ-NSG-EASTUS2-DEV-001"
      + resource_group_name = "M24-AZ-NETWORKING-EASTUS2-DEV-001"
      + security_rule       = (known after apply)
      + tags                = {
          + "Ambiente"    = "DEV"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
    }

  # module.network.azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "eastus2"
      + name     = "M24-AZ-NETWORKING-EASTUS2-DEV-001"
      + tags     = {
          + "Ambiente"    = "DEV"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
    }

  # module.network.azurerm_virtual_network.vnet will be created
  + resource "azurerm_virtual_network" "vnet" {
      + address_space       = [
          + "10.120.0.0/16",
        ]
      + dns_servers         = [
          + "192.168.48.10",
          + "172.17.48.10",
        ]
      + id                  = (known after apply)
      + location            = "eastus2"
      + name                = "M24-AZ-VNET-EASTUS2-DEV-001"
      + resource_group_name = "M24-AZ-NETWORKING-EASTUS2-DEV-001"
      + tags                = {
          + "Ambiente"    = "DEV"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }

      + ddos_protection_plan {
          + enable = true
          + id     = (known after apply)
        }

      + subnet {
          + address_prefix = "10.120.0.0/22"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-AKS-EASTUS2-DEV-001"
        }
      + subnet {
          + address_prefix = "10.120.4.0/25"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-VM-EASTUS2-DEV-001"
        }
      + subnet {
          + address_prefix = "10.120.5.0/27"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-EVH-EASTUS2-DEV-001"
        }
      + subnet {
          + address_prefix = "10.120.6.0/27"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-SQLMI-EASTUS2-DEV-001"
        }
    }

  # module.network.azurerm_virtual_network_peering.peering will be created
  + resource "azurerm_virtual_network_peering" "peering" {
      + allow_forwarded_traffic      = false
      + allow_gateway_transit        = false
      + allow_virtual_network_access = true
      + id                           = (known after apply)
      + name                         = "M24-AZ-VNET-EASTUS2-DEV-001_to_M24-AZ-VNET-EASTUS2-OnPremises-001"
      + remote_virtual_network_id    = "/subscriptions/bfc6eee2-0dfd-4de0-8535-5d565e6b9dd7/resourceGroups/PRD/providers/Microsoft.Network/virtualNetworks/DEV-VNET"
      + resource_group_name          = "M24-AZ-NETWORKING-EASTUS2-DEV-001"
      + use_remote_gateways          = true
      + virtual_network_name         = "M24-AZ-VNET-EASTUS2-DEV-001"
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + azurerm_network_ddos_protection_plan = "M24-AZ-DDOS-EASTUS2-DEV-001"
  + azurerm_network_security_group       = "M24-AZ-NSG-EASTUS2-DEV-001"
  + location                             = "eastus2"
  + peering_id_remote                    = "/subscriptions/bfc6eee2-0dfd-4de0-8535-5d565e6b9dd7/resourceGroups/PRD/providers/Microsoft.Network/virtualNetworks/DEV-VNET"
  + peering_name                         = "M24-AZ-VNET-EASTUS2-DEV-001_to_M24-AZ-VNET-EASTUS2-OnPremises-001"
  + resource_group                       = "M24-AZ-NETWORKING-EASTUS2-DEV-001"
  + subnets                              = {
      + "aks"   = {
          + address_prefix = "10.120.0.0/22"
          + name           = "M24-AZ-SNET-AKS-EASTUS2-DEV-001"
        }
      + "evh"   = {
          + address_prefix = "10.120.5.0/27"
          + name           = "M24-AZ-SNET-EVH-EASTUS2-DEV-001"
        }
      + "sqlmi" = {
          + address_prefix = "10.120.6.0/27"
          + name           = "M24-AZ-SNET-SQLMI-EASTUS2-DEV-001"
        }
      + "vm"    = {
          + address_prefix = "10.120.4.0/25"
          + name           = "M24-AZ-SNET-VM-EASTUS2-DEV-001"
        }
    }
  + virtual_network_address_prefix       = "10.120.0.0/16"
  + virtual_network_name                 = "M24-AZ-VNET-EASTUS2-DEV-001"
```

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.




# Environment Staging

```
terraform init
terraform plan  --var-file="environment/staging/staging.tfvars.json"
terraform apply --var-file="environment/staging/staging.tfvars.json"
```
```hcl
❯ terraform plan  --var-file="environment/staging/staging.tfvars.json"

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "eastus2"
      + name     = "M24-AZ-NETWORKING-EASTUS2-STAGING-001"
      + tags     = {
          + "Ambiente"    = "STAGING"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
    }

  # module.network.azurerm_network_ddos_protection_plan.ddospp will be created
  + resource "azurerm_network_ddos_protection_plan" "ddospp" {
      + id                  = (known after apply)
      + location            = "eastus2"
      + name                = "M24-AZ-DDOS-EASTUS2-STAGING-001"
      + resource_group_name = "M24-AZ-NETWORKING-EASTUS2-STAGING-001"
      + tags                = {
          + "Ambiente"    = "STAGING"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
      + virtual_network_ids = (known after apply)
    }

  # module.network.azurerm_network_security_group.nsg will be created
  + resource "azurerm_network_security_group" "nsg" {
      + id                  = (known after apply)
      + location            = "eastus2"
      + name                = "M24-AZ-NSG-EASTUS2-STAGING-001"
      + resource_group_name = "M24-AZ-NETWORKING-EASTUS2-STAGING-001"
      + security_rule       = (known after apply)
      + tags                = {
          + "Ambiente"    = "STAGING"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
    }

  # module.network.azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "eastus2"
      + name     = "M24-AZ-NETWORKING-EASTUS2-STAGING-001"
      + tags     = {
          + "Ambiente"    = "STAGING"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
    }

  # module.network.azurerm_virtual_network.vnet will be created
  + resource "azurerm_virtual_network" "vnet" {
      + address_space       = [
          + "10.121.0.0/16",
        ]
      + dns_servers         = [
          + "192.168.49.10",
          + "172.17.49.10",
        ]
      + id                  = (known after apply)
      + location            = "eastus2"
      + name                = "M24-AZ-VNET-EASTUS2-STAGING-001"
      + resource_group_name = "M24-AZ-NETWORKING-EASTUS2-STAGING-001"
      + tags                = {
          + "Ambiente"    = "STAGING"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }

      + ddos_protection_plan {
          + enable = true
          + id     = (known after apply)
        }

      + subnet {
          + address_prefix = "10.121.0.0/22"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-AKS-EASTUS2-STAGING-001"
        }
      + subnet {
          + address_prefix = "10.121.4.0/25"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-VM-EASTUS2-STAGING-001"
        }
      + subnet {
          + address_prefix = "10.121.5.0/27"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-EVH-EASTUS2-STAGING-001"
        }
      + subnet {
          + address_prefix = "10.121.6.0/27"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-SQLMI-EASTUS2-STAGING-001"
        }
    }

  # module.network.azurerm_virtual_network_peering.peering will be created
  + resource "azurerm_virtual_network_peering" "peering" {
      + allow_forwarded_traffic      = false
      + allow_gateway_transit        = false
      + allow_virtual_network_access = true
      + id                           = (known after apply)
      + name                         = "M24-AZ-VNET-EASTUS2-STAGING-001_to_M24-AZ-VNET-EASTUS2-OnPremises-001"
      + remote_virtual_network_id    = "/subscriptions/bfc6eee2-0dfd-4de0-8535-5d565e6b9dd7/resourceGroups/PRD/providers/Microsoft.Network/virtualNetworks/PRDVNET"
      + resource_group_name          = "M24-AZ-NETWORKING-EASTUS2-STAGING-001"
      + use_remote_gateways          = true
      + virtual_network_name         = "M24-AZ-VNET-EASTUS2-STAGING-001"
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + azurerm_network_ddos_protection_plan = "M24-AZ-DDOS-EASTUS2-STAGING-001"
  + azurerm_network_security_group       = "M24-AZ-NSG-EASTUS2-STAGING-001"
  + location                             = "eastus2"
  + peering_id_remote                    = "/subscriptions/bfc6eee2-0dfd-4de0-8535-5d565e6b9dd7/resourceGroups/PRD/providers/Microsoft.Network/virtualNetworks/PRDVNET"
  + peering_name                         = "M24-AZ-VNET-EASTUS2-STAGING-001_to_M24-AZ-VNET-EASTUS2-OnPremises-001"
  + resource_group                       = "M24-AZ-NETWORKING-EASTUS2-STAGING-001"
  + subnets                              = {
      + "aks"   = {
          + address_prefix = "10.121.0.0/22"
          + name           = "M24-AZ-SNET-AKS-EASTUS2-STAGING-001"
        }
      + "evh"   = {
          + address_prefix = "10.121.5.0/27"
          + name           = "M24-AZ-SNET-EVH-EASTUS2-STAGING-001"
        }
      + "sqlmi" = {
          + address_prefix = "10.121.6.0/27"
          + name           = "M24-AZ-SNET-SQLMI-EASTUS2-STAGING-001"
        }
      + "vm"    = {
          + address_prefix = "10.121.4.0/25"
          + name           = "M24-AZ-SNET-VM-EASTUS2-STAGING-001"
        }
    }
  + virtual_network_address_prefix       = "10.121.0.0/16"
  + virtual_network_name                 = "M24-AZ-VNET-EASTUS2-STAGING-001"
```

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

# Environment Productions

```
terraform init
terraform plan  --var-file="environment/productions/prod.tfvars.json"
terraform apply --var-file="environment/productions/prod.tfvars.json"
```
```hcl
❯ terraform plan  --var-file="environment/productions/prod.tfvars.json"

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "eastus2"
      + name     = "M24-AZ-NETWORKING-EASTUS2-PROD-001"
      + tags     = {
          + "Ambiente"    = "prod"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
    }

  # module.network.azurerm_network_ddos_protection_plan.ddospp will be created
  + resource "azurerm_network_ddos_protection_plan" "ddospp" {
      + id                  = (known after apply)
      + location            = "eastus2"
      + name                = "M24-AZ-DDOS-EASTUS2-PROD-001"
      + resource_group_name = "M24-AZ-NETWORKING-EASTUS2-PROD-001"
      + tags                = {
          + "Ambiente"    = "prod"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
      + virtual_network_ids = (known after apply)
    }

  # module.network.azurerm_network_security_group.nsg will be created
  + resource "azurerm_network_security_group" "nsg" {
      + id                  = (known after apply)
      + location            = "eastus2"
      + name                = "M24-AZ-NSG-EASTUS2-PROD-001"
      + resource_group_name = "M24-AZ-NETWORKING-EASTUS2-PROD-001"
      + security_rule       = (known after apply)
      + tags                = {
          + "Ambiente"    = "prod"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
    }

  # module.network.azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "eastus2"
      + name     = "M24-AZ-NETWORKING-EASTUS2-PROD-001"
      + tags     = {
          + "Ambiente"    = "prod"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }
    }

  # module.network.azurerm_virtual_network.vnet will be created
  + resource "azurerm_virtual_network" "vnet" {
      + address_space       = [
          + "10.122.0.0/16",
        ]
      + dns_servers         = [
          + "192.168.50.10",
          + "172.17.50.10",
        ]
      + id                  = (known after apply)
      + location            = "eastus2"
      + name                = "M24-AZ-VNET-EASTUS2-PROD-001"
      + resource_group_name = "M24-AZ-NETWORKING-EASTUS2-PROD-001"
      + tags                = {
          + "Ambiente"    = "prod"
          + "Aplicativo"  = "Aplicación Web Magnetoxx24"
          + "Managed"     = "Terraform"
          + "Owner"       = "Magnetoxx24"
          + "Responsable" = "Team SRE"
        }

      + ddos_protection_plan {
          + enable = true
          + id     = (known after apply)
        }

      + subnet {
          + address_prefix = "10.122.0.0/22"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-AKS-EASTUS2-PROD-001"
        }
      + subnet {
          + address_prefix = "10.122.4.0/25"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-VM-EASTUS2-PROD-001"
        }
      + subnet {
          + address_prefix = "10.122.5.0/27"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-EVH-EASTUS2-PROD-001"
        }
      + subnet {
          + address_prefix = "10.122.6.0/27"
          + id             = (known after apply)
          + name           = "M24-AZ-SNET-SQLMI-EASTUS2-PROD-001"
        }
    }

  # module.network.azurerm_virtual_network_peering.peering will be created
  + resource "azurerm_virtual_network_peering" "peering" {
      + allow_forwarded_traffic      = false
      + allow_gateway_transit        = false
      + allow_virtual_network_access = true
      + id                           = (known after apply)
      + name                         = "M24-AZ-VNET-EASTUS2-PROD-001_to_M24-AZ-VNET-EASTUS2-OnPremises-001"
      + remote_virtual_network_id    = "/subscriptions/bfc6eee2-0dfd-4de0-8535-5d565e6b9dd7/resourceGroups/PRD/providers/Microsoft.Network/virtualNetworks/PRDVNET"
      + resource_group_name          = "M24-AZ-NETWORKING-EASTUS2-PROD-001"
      + use_remote_gateways          = true
      + virtual_network_name         = "M24-AZ-VNET-EASTUS2-PROD-001"
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + azurerm_network_ddos_protection_plan = "M24-AZ-DDOS-EASTUS2-PROD-001"
  + azurerm_network_security_group       = "M24-AZ-NSG-EASTUS2-PROD-001"
  + location                             = "eastus2"
  + peering_id_remote                    = "/subscriptions/bfc6eee2-0dfd-4de0-8535-5d565e6b9dd7/resourceGroups/PRD/providers/Microsoft.Network/virtualNetworks/PRDVNET"
  + peering_name                         = "M24-AZ-VNET-EASTUS2-PROD-001_to_M24-AZ-VNET-EASTUS2-OnPremises-001"
  + resource_group                       = "M24-AZ-NETWORKING-EASTUS2-PROD-001"
  + subnets                              = {
      + "aks"   = {
          + address_prefix = "10.122.0.0/22"
          + name           = "M24-AZ-SNET-AKS-EASTUS2-PROD-001"
        }
      + "evh"   = {
          + address_prefix = "10.122.5.0/27"
          + name           = "M24-AZ-SNET-EVH-EASTUS2-PROD-001"
        }
      + "sqlmi" = {
          + address_prefix = "10.122.6.0/27"
          + name           = "M24-AZ-SNET-SQLMI-EASTUS2-PROD-001"
        }
      + "vm"    = {
          + address_prefix = "10.122.4.0/25"
          + name           = "M24-AZ-SNET-VM-EASTUS2-PROD-001"
        }
    }
  + virtual_network_address_prefix       = "10.122.0.0/16"
  + virtual_network_name                 = "M24-AZ-VNET-EASTUS2-PROD-001"
```

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
