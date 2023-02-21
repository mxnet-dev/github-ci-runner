
resource "vsphere_virtual_machine" "github-runner" {
  name             = var.vm_hostname
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 4
  memory   = 4096
  guest_id = data.vsphere_virtual_machine.template.guest_id
  firmware = "efi"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "${var.vm_hostname}-disk"
    size             = 40
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  extra_config = {
    "guestinfo.metadata" = base64gzip(templatefile("./cloud-config/meta_runner.yml", {
      hostname  = var.vm_hostname
      ipaddress = var.vm_ipaddress
    }))
    "guestinfo.metadata.encoding" = "gzip+base64"

    "guestinfo.userdata" = base64gzip(templatefile("./cloud-config/user_runner.yml", {
      ipaddress      = var.vm_ipaddress
      docker_user    = var.vm_username
    }))
    "guestinfo.userdata.encoding" = "gzip+base64"
  }
}