Vagrant.configure(2) do |config|
    config.vm.define "controlnode" do |controlnode|
        controlnode.vm.box = "ubuntu/focal64"
        controlnode.vm.network "public_network"
      	controlnode.vm.provision :shell, path: "setup_scripts/ansiblesetup.sh"
        controlnode.vm.provision :shell, path: "setup_scripts/dockersetup.sh"
        controlnode.vm.provision :shell, path: "setup_scripts/jenkinssetup.sh"
    end
    config.vm.define "managednode" do |managednode|
        managednode.vm.box = "ubuntu/focal64"
        managednode.vm.network "public_network"
    end
end
