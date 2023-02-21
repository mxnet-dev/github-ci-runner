### Ubuntu 22.04 LTS - Docker Stack version ###

build {
  sources = ["source.vsphere-iso.ubuntu-2204lts"]

  provisioner "ansible" {
    user          = var.ssh_username
    playbook_file = "./playbooks/ubuntu-gh-runner-main.yml"
    ansible_ssh_extra_args = ["-oHostKeyAlgorithms=+ssh-rsa -oPubKeyAcceptedKeyTypes=+ssh-rsa"]
    ansible_env_vars = ["ANSIBLE_SSH_TRANSFER_METHOD=smart"]
  }

  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{.Vars}} sudo -S -E bash '{{.Path}}'"

    environment_vars = [
      "BUILD_USERNAME=${var.ssh_username}",
    ]

    scripts           = ["./scripts/setup_ubuntu2204.sh"]
    expect_disconnect = true
  }
}