# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # EMBA uses kalilinux as base distroy
  config.vm.box = "kalilinux/rolling"
  config.vm.hostname = "EMBAbox"
  config.disksize.size = "400GB"
  config.vm.boot_timeout = 500
  # port forward for embark
  config.vm.network "forwarded_port", guest: 80, host: 8888

  config.ssh.keep_alive = true
  config.ssh.insert_key = true


  # https://github.com/e-m-b-a/emba/wiki/Installation
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false      # Disable GUI
    vb.cpus = 4         # 4 CPU's
    vb.memory = "10000" # 10Gig
   end

  # Remove swap and resize the file system
  config.vm.provision "shell", path: "resize-root.sh" , name: "resize_root"

  config.vm.provision "shell" do |s|
	s.name = "use_be_mirror "
	s.privileged = true
	s.inline = <<-SHELL
        # The .NL mirror that is automatically selected here .. 
        cp /etc/apt/sources.list /etc/apt/sources.list.orig
        cat /etc/apt/sources.list.orig | sed "s,^deb,# x7 deb,g" > /etc/apt/sources.list
        rm /etc/apt/sources.list.orig
        echo "deb http://ftp.belnet.be/pub/kali/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list
	SHELL
  end
  config.vm.provision "shell", path: "install-emba.sh" , name: "install_emba"
  #config.vm.provision "shell", path: "install-embark.sh", name: "install_embark"
end
