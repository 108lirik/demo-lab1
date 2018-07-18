# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrant base box to use

BOX_BASE = "ubuntu/xenial64"  
# amount of RAM for Vagrant box
BOX_RAM_MB = "1024"  
# number of CPUs for Vagrant box
BOX_CPU_COUNT = "1"
IP1 = "192.168.33.55"
IP2 = "192.168.33.56"
IP3 = "192.168.33.57"

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |subconfig|
      subconfig.linked_clone = true
      subconfig.customize [ "modifyvm", :id, "--memory", BOX_RAM_MB, "--cpus", BOX_CPU_COUNT ]
  end
  
  config.vm.define :jenkins do |subconfig|
      subconfig.vm.hostname = "jenkins"
      subconfig.vm.box = BOX_BASE
      subconfig.vm.network "private_network", ip: IP1
      subconfig.vm.synced_folder ".", "/vagrant"
      subconfig.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "1536"]
      end
      subconfig.vm.provision :shell,
          :path => "provision.sh"

      subconfig.vm.provision "docker" do |d|
        d.run "registry:2",
        args: "-d -p 5000:5000 --restart=always --name registry"
      end

  end
  
  config.vm.define :dev do |subconfig|
      subconfig.vm.hostname = "dev"
      subconfig.vm.box = BOX_BASE
      subconfig.vm.network "private_network", ip: IP2
      subconfig.vm.synced_folder ".", "/vagrant"
    
      subconfig.vm.provision :shell,
          :path => "provision-env.sh"
  end
  
      
  config.vm.define :qa do |subconfig|
      subconfig.vm.hostname = "qa"
      subconfig.vm.box = BOX_BASE
      subconfig.vm.network "private_network", ip: IP3
      subconfig.vm.synced_folder ".", "/vagrant"
    
      subconfig.vm.provision :shell,
          :path => "provision-env.sh"
  end
end
