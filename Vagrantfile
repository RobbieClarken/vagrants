Vagrant.configure("2") do |config|

  #config.vm.network "public_network"

  config.vm.define "fedora-20-epics", primary: true do |cfg|
    cfg.vm.box = "chef/fedora-20"
    cfg.vm.provision :shell, path: "provisioners/fedora-20-epics.sh"
  end

  config.vm.define "ubuntu-12-epics", autostart: false do |cfg|
    cfg.vm.box = "hashicorp/precise64"
    cfg.vm.provision :shell, path: "provisioners/ubuntu-12-epics.sh"
  end

end
