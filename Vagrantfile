# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

#  config.vm.box = "landregistry/centos-beta"
  config.vm.box = "hashicorp/precise64"
  config.vm.network "public_network", :bridge => '300Mbps Wireless USB Adapter'
 
  config.vm.network "forwarded_port", guest: 5001, host: 5003
  config.vm.network :forwarded_port, guest: 80, host: 8083
  config.vm.network :forwarded_port, guest: 9200, host: 9200 
  config.vm.hostname ="knowman"
  config.vm.provision "shell", path: "provision.sh"
end
 

 
 