# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  Vagrant.require_version '>= 1.6'

  config.vm.box = 'carmenpuccio/windows-server-2012-r2-test'
  config.vm.guest = :windows
  config.vm.communicator = 'winrm'

  config.vm.network :forwarded_port,
                    id: 'ssh',
                    guest: 22,
                    host: 2200,
                    disabled: 'true'

  config.vm.provider 'virtualbox' do |box|
    box.gui = true
    box.cpus = 2
    box.memory = 2048
  end

  if Vagrant.has_plugin?('vagrant-omnibus')
    config.omnibus.chef_version = 'latest'
  end

  config.berkshelf.enabled = true

  config.vm.provision 'chef_zero' do |chef|
    chef.add_recipe 'aspemail_net_cookbook::default'
  end
end
