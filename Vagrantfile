# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrant base box to use

BOX_BASE = "ubuntu/xenial64"  
# amount of RAM for Vagrant box
BOX_RAM_MB = "2048"  
# number of CPUs for Vagrant box
BOX_CPU_COUNT = "1"
IP1 = "192.168.33.55"
IP2 = "192.168.33.56"
IP3 = "192.168.33.57"

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |box|
      box.linked_clone = true
      box.customize [ "modifyvm", :id, "--memory", BOX_RAM_MB, "--cpus", BOX_CPU_COUNT ]
  end
  
  config.vm.define :jenkins do |box|
      box.vm.hostname = "jenkins"
      box.vm.box = BOX_BASE
      box.vm.network "private_network", ip: IP1
      box.vm.synced_folder ".", "/vagrant"
    
      box.vm.provision :shell,
          :path => "provision.sh",
          :args => "master", 
          :preserve_order => true,
          :run => "always"
  end
  
    config.vm.define :dev do |box|
      box.vm.hostname = "dev"
      box.vm.box = BOX_BASE
      box.vm.network "private_network", ip: IP2
      box.vm.synced_folder ".", "/vagrant"
    
      box.vm.provision :shell,
          :path => "provision-env.sh",
          :args => "slave", 
          :preserve_order => true,
          :run => "always"
  end
  
      
      config.vm.define :qa do |box|
      box.vm.hostname = "qa"
      box.vm.box = BOX_BASE
      box.vm.network "private_network", ip: IP3
      box.vm.synced_folder ".", "/vagrant"
    
      box.vm.provision :shell,
          :path => "provision-env.sh",
          :args => "slave", 
          :preserve_order => true,
          :run => "always"
      end
end
