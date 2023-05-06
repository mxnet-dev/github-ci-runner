terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
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