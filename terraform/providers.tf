terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.8.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }

  cloud {
    organization = "MXNet"
    workspaces {
      name = "MXNet-CLI"
    }
  }
}


provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

provider "local" {

}