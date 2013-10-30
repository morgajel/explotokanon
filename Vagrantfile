# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "base"
  config.vm.host_name = "explotokanon"

  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
#  config.vm.network :bridged, :bridge => "wlan0"


  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui


  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.

  config.vm.provision :puppet do |puppet|
    puppet.options = "--hiera_config puppet/hiera.yaml"
    puppet.module_path    = "puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "base.pp"

    puppet.facter = {
        ## tells default.pp that we're running in Vagrant
        "is_vagrant" => true,
    }
 
  end

end
