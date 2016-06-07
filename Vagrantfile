# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #
  # Configure VirtualBox Provider
  #
  config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
  end

  config.vm.define "meter-plugin-1" do |v|
    v.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    v.vm.hostname = "meter-plugin-1"
    v.vm.box_version = "1.0.1"
  end

  #
  # Add the required puppet modules before provisioning is run by puppet
  #
  config.vm.provision :shell do |shell|
     shell.inline = "puppet module install puppetlabs-apt;
                     puppet module install puppetlabs-stdlib;
                     puppet module install boundary-boundary;
                     puppet module install puppetlabs-git;
		     touch /etc/puppet/hiera.yaml;
                     exit 0"
  end

  #
  # Use Puppet to provision the server and setup an elastic search cluster
  # on a single box
  #
  config.vm.provision "puppet" do |puppet|
    puppet.environment_path = "environments"
    puppet.environment = "production"
#    puppet.options = "--verbose --debug"
    puppet.facter = {
      "api_token" => ENV["TSP_API_TOKEN"]
    }
  end
end
