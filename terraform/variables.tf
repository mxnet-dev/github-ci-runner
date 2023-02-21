# ---------------------------------------------------------------------------------------------------------------------
# VMWARE PROVIDER VARIABLES
# These are used to connect to vCenter.
# ---------------------------------------------------------------------------------------------------------------------

variable "vsphere_server" {
  type        = string
  description = "IP or FQDN of the vSphere server into which resources will be created."
}

variable "vsphere_user" {
  type        = string
  description = "Username of an admin of the vSphere server into which resources will be created."
  sensitive   = true
}

variable "vsphere_password" {
  type        = string
  description = "Plaintext password of an admin of the vSphere server into which resources will be created."
  sensitive   = true
}


# ---------------------------------------------------------------------------------------------------------------------
# VMWARE DATA SOURCE VARIABLES
# These are used to discover unmanaged resources used during deployment.
# ---------------------------------------------------------------------------------------------------------------------

variable "datacenter_name" {
  type        = string
  description = "The name of the vSphere Datacenter into which resources will be created."
}

variable "cluster_name" {
  type        = string
  description = "The vSphere cluster into which resources will be created."
}

variable "datastore_name" {
  type        = string
  description = "The vSphere Datastore into which resources will be created."
}

variable "datastore_cluster_name" {
  type    = string
  default = ""
}

variable "vm_network_name" {
  type = string
}

variable "template_name" {
  type = string
}


# ---------------------------------------------------------------------------------------------------------------------
# CLOUD INIT VARIABLES
# Variables used for generation of metadata and userdata.
# ---------------------------------------------------------------------------------------------------------------------

variable "vm_hostname" {
  type        = string
  description = "The hostname of the VM"
}

variable "vm_ipaddress" {
  type        = string
  description = "The IP address of the VM"
}

variable "vm_username" {
  type        = string
  description = "Username of the created user in the VM"
}
