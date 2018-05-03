# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.8"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.synced_folder "~/.aws", "/home/vagrant/.aws"

  config.vm.provider :virtualbox do |vb|
    vb.memory = 6096
    vb.cpus = 4
  end

  # Webpack Dev Server
  config.vm.network :forwarded_port, guest: 4567, host: 4567

  # Change working directory to /vagrant upon session start.
  config.vm.provision "shell", inline: <<SCRIPT
    if ! grep -q "cd /vagrant" "/home/vagrant/.bashrc"; then
      echo "cd /vagrant" >> "/home/vagrant/.bashrc"
    fi
SCRIPT

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "deployment/ansible/nj-wildlife.yml"
    ansible.galaxy_role_file = "deployment/ansible/roles.yml"
  end
end
