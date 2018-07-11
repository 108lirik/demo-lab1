# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |box|
      box.linked_clone = true
      box.customize [ "modifyvm", :id, "--memory", "1024", "--cpus", "1" ]
  end
  
  config.vm.define :jenkins do |box|
      box.vm.hostname = "jenkins"
      box.vm.box = "ubuntu/xenial64"
      box.vm.network "private_network", ip: "192.168.33.55"
      box.vm.synced_folder ".", "/vagrant"
    
      box.vm.provision :shell,
          :path => "provision.sh",
          :args => "master", 
          :preserve_order => true,
          :run => "always"
  end
  
    config.vm.define :dev do |box|
      box.vm.hostname = "dev"
      box.vm.box = "ubuntu/xenial64"
      box.vm.network "private_network", ip: "192.168.33.56"
      box.vm.synced_folder ".", "/vagrant"
    
      box.vm.provision :shell,
          :path => "provision-env.sh",
          :args => "slave", 
          :preserve_order => true,
          :run => "always"
  end
  
      config.vm.define :stage do |box|
      box.vm.hostname = "stage"
      box.vm.box = "ubuntu/xenial64"
      box.vm.network "private_network", ip: "192.168.33.57"
      box.vm.synced_folder ".", "/vagrant"
    
      box.vm.provision :shell,
          :path => "provision-env.sh",
          :args => "slave", 
          :preserve_order => true,
          :run => "always"
  end
  
      config.vm.define :qa do |box|
      box.vm.hostname = "qa"
      box.vm.box = "ubuntu/xenial64"
      box.vm.network "private_network", ip: "192.168.33.58"
      box.vm.synced_folder ".", "/vagrant"
    
      box.vm.provision :shell,
          :path => "provision-env.sh",
          :args => "slave", 
          :preserve_order => true,
          :run => "always"
      end
end