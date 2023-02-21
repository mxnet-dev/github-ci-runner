# VMWARE PROVIDER VARIABLES

vsphere_server   = "op://Lab/vSphere-vars/website"
vsphere_user     = "op://Lab/vSphere-vars/username"
vsphere_password = "op://Lab/vSphere-vars/password"


# VMWARE DATA SOURCE VARIABLES

datacenter_name = "op://Lab/vSphere-vars/vm-data/datacenter"
cluster_name    = "op://Lab/vSphere-vars/vm-data/cluster"
datastore_name  = "vsanDatastore"
vm_network_name = "VM Network"
template_name   = "linux-ubuntu-server-22.04-lts-runner"


# CLOUD INIT VARIABLES

vm_hostname  = "octocat"
vm_ipaddress = "10.200.35.1"

vm_username  = "op://Lab/ansible-vars/username"