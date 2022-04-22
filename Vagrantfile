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

  config.vm.provision "shell" do |s|
	s.name = "pre_fix_sudo"
	s.privileged = true
	s.inline = <<-SHELL
	    # During the installation of emba
    	# the .bashrc of the root user is modified to 
    	# source .cargo/env but this file does not exist
    	# hence later sudo commands are not well recieved
		mkdir -p /root/.cargo
		# Dummy cargo env created
		echo DUMMY=true > /root/.cargo/env

        #
        # the .NL mirror that is automatically selected here .. 
        cp /etc/apt/sources.list /etc/apt/sources.list.orig
        cat /etc/apt/sources.list.orig | sed "s,^deb,# x7 deb,g" > /etc/apt/sources.list
        rm /etc/apt/sources.list.orig
        echo "deb http://ftp.belnet.be/pub/kali/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list
	SHELL
  end
  #config.vm.provision "shell", path: "install-docker.sh"
  #config.vm.provision "shell", path: "install-mogodb.sh"
  config.vm.provision "shell", path: "install-emba.sh" , name: "install_emba"
  config.vm.provision "shell", path: "install-embark.sh", name: "install_embark"
end
