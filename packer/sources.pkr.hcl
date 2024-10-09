### Ubuntu Server 22.04.1 LTS ###
source "vsphere-iso" "ubuntu-2204lts" {

  vcenter_server       = var.vcenter_server
  username             = var.vcenter_username
  password             = var.vcenter_password
  datacenter           = var.vcenter_datacenter
  datastore            = var.vcenter_datastore
  cluster              = var.vcenter_cluster
  folder               = var.vcenter_folder
  insecure_connection  = var.vcenter_insecure_connection
  tools_upgrade_policy = true
  remove_cdrom         = true
  convert_to_template  = true
  guest_os_type        = "ubuntu64Guest"
  vm_version           = var.vm_version

  notes                = "Built by HashiCorp Packer on ${local.buildtime}."
  vm_name              = "linux-ubuntu-server-22.04-lts-runner"
  firmware             = "efi"
  CPUs                 = 2
  cpu_cores            = 4
  CPU_hot_plug         = false
  RAM                  = 8192
  RAM_hot_plug         = false
  cdrom_type           = var.vm_cdrom_type
  disk_controller_type = var.vm_disk_controller_type

  storage {
    disk_size             = 40960
    disk_controller_index = 0
    disk_thin_provisioned = true
  }

  network_adapters {
    network      = var.vcenter_network
    network_card = var.vm_network_card
  }

  iso_url        = "https://releases.ubuntu.com/22.04/ubuntu-22.04.5-live-server-amd64.iso"
  iso_checksum   = "file:http://releases.ubuntu.com/22.04/SHA256SUMS"
  http_directory = "${var.http_directory}"
  boot_order     = "disk,cdrom"
  boot_wait      = "3s"

  boot_command = [
    "<wait>",
    "c",
    "<wait>",
    "linux /casper/vmlinuz autoinstall --- 'ds=nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/'<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>",
    "<enter><wait>"
  ]

  ip_wait_timeout        = "20m"
  ssh_password           = var.ssh_password
  ssh_username           = var.ssh_username
  ssh_port               = 22
  ssh_timeout            = "30m"
  ssh_handshake_attempts = "100000"
  shutdown_command       = "echo '${var.ssh_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout       = "15m"
}

### Ubuntu Server 20.04.3 LTS ###
source "vsphere-iso" "ubuntu-20043lts" {

  vcenter_server       = var.vcenter_server
  username             = var.vcenter_username
  password             = var.vcenter_password
  // datacenter           = var.vcenter_datacenter
  datastore            = var.vcenter_datastore
  host                 = var.vcenter_host
  folder               = var.vcenter_folder
  insecure_connection  = var.vcenter_insecure_connection
  tools_upgrade_policy = true
  remove_cdrom         = true
  convert_to_template  = true
  guest_os_type        = "ubuntu64Guest"
  vm_version           = var.vm_version

  notes                = "Built by HashiCorp Packer on ${local.buildtime}."
  vm_name              = "linux-ubuntu-server-20.04.3-lts-docker"
  firmware             = "efi"
  CPUs                 = 2
  cpu_cores            = 4
  CPU_hot_plug         = false
  RAM                  = 8192
  RAM_hot_plug         = false
  cdrom_type           = var.vm_cdrom_type
  disk_controller_type = var.vm_disk_controller_type

  storage {
    disk_size             = 40960
    disk_controller_index = 0
    disk_thin_provisioned = true
  }

  network_adapters {
    network      = var.vcenter_network
    network_card = var.vm_network_card
  }

  iso_url        = "https://releases.ubuntu.com/20.04/ubuntu-20.04.4-live-server-amd64.iso"
  iso_checksum   = "file:http://releases.ubuntu.com/20.04/SHA256SUMS"
  http_directory = "${var.http_directory}"
  boot_order     = "disk,cdrom"
  boot_wait      = "3s"

  boot_command = [
    "<esc><esc><esc>",
    "set gfxpayload=keep<enter>",
    "linux /casper/vmlinuz ",
    "\"ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/\" ",
    "quiet autoinstall ---<enter>",
    "initrd /casper/initrd<enter>",
    "boot<enter>"
  ]

  ip_wait_timeout        = "20m"
  ssh_password           = var.ssh_password
  ssh_username           = var.ssh_username
  ssh_port               = 22
  ssh_timeout            = "30m"
  ssh_handshake_attempts = "100000"
  shutdown_command       = "echo '${var.ssh_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout       = "15m"
}