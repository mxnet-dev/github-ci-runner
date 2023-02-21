---
- name: Install GitHub Actions Runner
  hosts: default
  become: yes
  vars:
    - github_account: "op://Lab/ansible-vars/github-runner/org-user"
    - runner_org: yes
    - runner_group: "op://Lab/ansible-vars/github-runner/runner-group"
    - access_token: "op://Lab/GitHub API/ansible-runner-role-installer/token"
    - ansible_become_password: "op://Lab/ansible-vars/github-runner/become-password"
    - runner_name: "octocat"
  roles:
    - role: monolithprojects.github_actions_runner