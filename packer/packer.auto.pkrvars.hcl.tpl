### vSphere connection data ###
vcenter_username            = "op://Lab/vSphere-vars/username"
vcenter_password            = "op://Lab/vSphere-vars/password"
vcenter_server              = "op://Lab/vSphere-vars/website"
vcenter_insecure_connection = true

### vSphere VM data ###
vcenter_datacenter = "op://Lab/vSphere-vars/vm-data/datacenter"
vcenter_cluster    = "op://Lab/vSphere-vars/vm-data/cluster"
vcenter_datastore  = "vsanDatastore"
vcenter_network    = "VM Network"
vcenter_folder     = "Packer Templates"

### SSH Connection Data ###
ssh_username = "packer"
ssh_password = "packer"

# HTTP Endpoint
http_directory = "http/ubuntu/"

# Virtual Machine Settings
# https://kb.vmware.com/s/article/1003746
vm_version              = 19
vm_cdrom_type           = "sata"
vm_disk_controller_type = ["pvscsi"]
vm_network_card         = "vmxnet3"