Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3306, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
end