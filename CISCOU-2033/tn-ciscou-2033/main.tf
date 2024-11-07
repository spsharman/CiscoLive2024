terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = ">=2.13.2"
    }
  }
}

provider "aci" {
  username = var.apic_username
  password = var.apic_password
  url      = var.apic_url
}

module "aci" {
    # source = "github.com/netascode/terraform-aci-nac-aci?ref=main"
  source  = "netascode/nac-aci/aci"
  version = ">=0.8.1"

  # yaml_directories = ["data/full"]
  # yaml_directories = ["data/sections/basic-configuration"]
  # yaml_directories = ["data/sections/basic-configuration", "data/sections/firewalls"]
  yaml_directories = ["data/sections/basic-configuration", "data/sections/firewalls", "data/sections/contracts"]


  manage_access_policies    = false
  manage_fabric_policies    = false
  manage_pod_policies       = false
  manage_node_policies      = false
  manage_interface_policies = false
  manage_tenants            = true
}
