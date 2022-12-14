# Network Cloud Azure module in Terraform, for the use of the following resources

Network Module in Terraform for the creation of Network and Security Resources.

## list of resources that you can deploy with the network cloud azure module:

```
- DDOS Proctetions Plan
- Network Security Group
- Peering
- Resource Group
- vNet 
```
### Module Settings

``` 
- Subnets 
- Network segments
- DNS Servers 
- Tags Projects 
``` 

By deploying the network module, we can have the ability to create the VNet and SubNets, as well as activate protection with DDOS Protection and Network Security Group.

# Complete Module Azure-Network example

the configuration of this directory will allow the use of the azure cloud network module with terraform

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | = 1.44.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | = 1.44.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network"></a> [network](#module\_network) | modules/network/ | = 1.44.0 |

## Resources

| Name | Type |
|------|------|
| [Resource Group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [DDoS Protection Plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan) | resource |
| [Network Security Groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [Virtual Network Peering](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [Virtual Network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="resource_group"></a> [resource_group](#resource_group) | Networking resource group name for network module resources. |
| <a name="location"></a> [location](#location) | Region defined for the deployment of network module resources. |
| <a name="network_security_group"></a> [network_security_group](#network_security_group) | network security group defined for network module resources. |
| <a name="ddos_protection_plan"></a> [ddos_protection_plan](#ddos_protection_plan) | DDoS attack protection service on network components. |
| <a name="vnet"></a> [vnet](#vnet) | Virtual network component created to provide addressing through subnets to resources. |
| <a name="address_space"></a> [address_space](#address_space) | Network segment for vNets. |
| <a name="subnets"></a> [subnets](#subnets) | Network segmentation in your networks for the logical separation of resources. |
| <a name="dns_servers"></a> [dns_servers](#dns_servers) | Declaration of IP addressing of DNS Servers. |
| <a name="peering_name"></a> [peering_name](#peering_name) | Allows the creation of connectivity between resources deployed in different vnets. |
| <a name="peering_id_remote"></a> [peering_id_remote](#peering_id_remote) | Remote vnet identifier to create connectivity between two resources. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

