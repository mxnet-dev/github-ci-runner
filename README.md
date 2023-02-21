# GitHub Self-Hosted Runner

### Purpose
This deploys a GitHub self hosted runner on the infrastructure.


## Pre-Requisites
### Local installs of:
- Git
- [Go Task](https://taskfile.dev/installation/)
- Ansible
  - [Actions Runner](https://galaxy.ansible.com/monolithprojects/github_actions_runner) role
- Terraform

Optional:
- Packer (if generation of a new template is necessary)
- 1Password for secret injection

### Server:
- VMware vSphere

### Operations:
Make sure templates for Packer and Terraform reflect the current infrastructure.

### Notes
If Packer fails, check the URL of the Ubuntu version on https://releases.ubuntu.com/22.04/.


## Usage
### Individual tasks
- `task decrypt` injects the secrets from 1Password
- `task template` creates a template with Packer
- `task vm` creates the VM with Terraform
- `task deploy` deploys the runner with Ansible
- `task remove` removes the runner with Ansible
- `task destroy` destroys the VM with Terraform

### One step operations
- `task ops-deploy` creates the VM and deploys the runner
  - Prerequisite: template is created
- `task ops-remove` removes the runner and destroys the VM