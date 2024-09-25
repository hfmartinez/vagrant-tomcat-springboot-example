Vagrant.configure("2") do |config|
  # Specify the base box for the virtual machine
  config.vm.box = "ubuntu/bionic64"

  # Configure network settings
  # Forward port 8080 from the guest VM to port 8080 on the host machine
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Set the name of the virtual machine
  config.vm.hostname = "spring-boot-vm"

  # Configure the virtual machine's hardware resources
  # Set the amount of memory (RAM) allocated to the VM
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048" # Memory in MB
    vb.cpus = 2 # Number of CPUs
    # vb.gui = true
  end

  # Increase the boot timeout
  config.vm.boot_timeout = 600 # Timeout in seconds

  # Provision the virtual machine using an external shell script
  config.vm.provision "shell", path: "provision.sh"
end
