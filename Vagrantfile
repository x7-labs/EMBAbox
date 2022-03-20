# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # EMBA uses kalilinux as base distroy
  config.vm.box = "kalilinux/rolling"
  config.vm.hostname = "EMBAbox"
  config.disksize.size = "100GB"
  config.vm.boot_timeout = 500

  config.ssh.keep_alive = true
  config.ssh.insert_key = true


  # https://github.com/e-m-b-a/emba/wiki/Installation
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false      # Disable GUI
    vb.cpus = 4         # 4 CPU's
    vb.memory = "10000" # 10Gig
   end

  #config.vm.provision "shell", path: "install-docker.sh"
  #config.vm.provision "shell", path: "install-mogodb.sh"
  config.vm.provision "shell", path: "install-emba.sh"
end
