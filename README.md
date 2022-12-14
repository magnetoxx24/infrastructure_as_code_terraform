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

![Image text](https://github.com/magnetoxx24/infrastructure_as_code_poc/blob/sandbox/terraform/cloud/azure/diagram/Diagram%20Module%20Network%20Cloud%20Azure%20Magnetoxx24-Network.jpg)

## To deploy the resources using the network module, you can use the following commands to be able to deploy by type of environment

# Environment Development

```
terraform init
terraform plan  --var-file="environment/development/dev.tfvars.json"
terraform apply --var-file="environment/development/dev.tfvars.json"
```

# Environment Staging

```
terraform init
terraform plan  --var-file="environment/staging/staging.tfvars.json"
terraform apply --var-file="environment/staging/staging.tfvars.json"
```

# Environment Productions

```
terraform init
terraform plan  --var-file="environment/productions/prod.tfvars.json"
terraform apply --var-file="environment/productions/prod.tfvars.json"
```
