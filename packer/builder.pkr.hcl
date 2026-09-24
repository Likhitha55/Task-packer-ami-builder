build {
  sources = ["source.amazon-ebs.my-custom-image"]


  provisioner "ansible" {
    playbook_file = "../ansible/playbooks/install-softwares.yml"

    ansible_env_vars = [
      "ANSIBLE_ROLES_PATH=../ansible/roles",
      "ANSIBLE_CONFIG=../ansible/ansible.cfg"
    ]
    extra_arguments = [
      "--scp-extra-args", "'-O'",
      "-e", "ansible_ssh_transfer_method=scp"
    ]

  }
  post-processor "manifest" {
    output     = "packer-manifest.json"
    strip_path = true
  }
  
}


