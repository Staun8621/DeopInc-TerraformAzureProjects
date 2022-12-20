# Azure Resource Deployment with Terraform

This repository contains a project of how to use Terraform to create a Linux VM in Azure.

The configuration deploys the following resources in Azure:

* A resource group
* A virtual network
* A subnet
* Public IPs
* A Network Security Group with an inbound rule for SSH access
* A network interface
* A storage account for boot diagnostics
* An SSH key

## Prerequisites

* An [Azure](https://azure.microsoft.com/) account 
* The Azure CLI installed and configured
* [Terraform](https://www.terraform.io/) installed and configured


# Insiders

This project is using the random_pet resource to create a random string to be used as the name of the resource group. The prefix variable is passed in from a variable file and is used to define the beginning of the random string.

It also creates a virtual network and a subnet within that virtual network. The virtual network uses the 10.0.0.0/16 address space, which allows for 65534 unique IP addresses. The subnet uses the 10.0.1.0/24 address space, which allows for 254 unique IP addresses.

Then it creates a public IP address, which allows resources in the virtual network to be accessed from the internet. It also creates a network security group and adds a security rule to allow inbound traffic over port 22 (SSH) from any source IP address.

A network interface is then created and associated with the subnet and public IP address. The network interface allows resources in the virtual network to communicate with the internet.

It also creates a storage account for storing boot diagnostic data and generates an SSH key for securely accessing virtual machines.


# Deployment

1. Clone this repository.
2. Open main.tf and set the following variables:
    * resource_group_name_prefix: the prefix for the name of the resource group
    * resource_group_location: the location for the resource group
5. Run terraform init to initialize the working directory.
6. Run terraform plan to create an execution plan.
7. Run terraform apply to deploy the resources to Azure.

# Cleanup
To remove the resources created by this Terraform configuration, run terraform destroy.

```bash
terraform destroy

```

# Notes
* The resource group name is randomly generated using the random_pet resource.
* The storage account name is randomly generated using the random_id resource.
* An SSH key is generated using the tls_private_key resource.