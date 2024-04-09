build {
  sources = ["source.amazon-ebs.ubuntu", "source.azure-arm.ubuntu"]

  provisioner "move_environments" {
    destination = "/tmp"
    source      = "/env/"
  }


  provisioner "shell" {
    inline = [
      "echo Installing Updates",
      "sudo apt-get update",
      "sudo apt-get upgrade -y"
    ]
  }
  provisioner "shell" {
    only   = ["source.amazon-ebs.ubuntu"]
    inline = ["sudo apt-get install awscli"]
  }

  provisioner "shell" {
    only   = ["source.azure-arm.ubuntu"]
    inline = ["sudo apt-get install azure-cli"]
  }

  provisioner "move_environments" {
    destination = "/tmp"
    source      = "/env/"
  }

  provisioner "shell"{
    inline = [
      "mkdir ~/src",
      "cd ~/src",
      "git clone https://github.com/username/your_project_name.git codebase",
      "cp -R ~/src/codebase/assets /tmp",
      "sudo sh /tmp/assets/setup-web.sh"        // Any setup you need to perform
    ]
  }
  post-processor "shell-local" {
    inline = ["echo \"Completed Provisioning the image\""]
  }

}
