# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.define "target" do |node|
    node.vm.hostname = "foodbook-vm"
    node.vm.network :forwarded_port, guest: 22, host: 2003, id: "ssh"
    node.vm.network :forwarded_port, guest: 80, host: 8083
    node.vm.network :private_network, ip: "192.168.33.13"
    # node.vm.synced_folder "./", "/vagrant", type: "nfs"
    node.vm.synced_folder ".", "/vagrant", disabled: true
  end

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "centos7.0-tommy-muehle"
  config.vm.box_url = "https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.name = "foodbook-vm"
    vb.memory = "4096"
    vb.cpus = "4"
    # vb.ioapic = "on"
    # vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "3", "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision :file, source: "provision/file/.git-completion.bash", destination: ".git-completion.bash"
  config.vm.provision :file, source: "provision/file/.git-prompt.sh", destination: ".git-prompt.sh"
  config.vm.provision :file, source: "provision/file/.bashrc", destination: ".bashrc"
  config.vm.provision :file, source: "provision/file/id_rsa", destination: ".ssh/id_rsa"

  config.vm.provision :shell, :path => "provision/base.sh"
  config.vm.provision :shell, :path => "provision/python.sh", privileged: false
  config.vm.provision :shell, :path => "provision/git.sh", privileged: false
  config.vm.provision :shell, :path => "provision/node.sh", privileged: false
  config.vm.provision :shell, :path => "provision/docker.sh"

  # pingが通らなくなるバグへの対応
  # http://qiita.com/junqiq/items/a19d3ea48b072a1b28d3
  config.vm.provision "shell", run: "always", inline: "systemctl restart network.service"
  # vagrant --> docker container へ直接通信を流すための設定
  config.vm.provision "shell", run: "always", inline: "sysctl -w net.ipv4.ip_forward=1"
end
