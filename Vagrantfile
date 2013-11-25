# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "raring-server-cloudimg-vagrant-amd64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"

  # config.vm.network "private_network", type: :dhcp
  config.vm.network "private_network", ip: "192.168.34.10"

  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  
  config.vm.provision :shell, :inline => "curl http://get.docker.io/gpg | apt-key add -"
  config.vm.provision :shell, :inline => "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
  config.vm.provision :shell, :inline => "apt-get update"
  config.vm.provision :shell, :inline => "su -c 'apt-get -y install linux-image-extra-`uname -r`'"
  config.vm.provision :shell, :inline => "apt-get -y install lxc-docker"
end
