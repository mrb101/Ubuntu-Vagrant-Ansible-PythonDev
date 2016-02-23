Vagrant.configure("2") do |config|

  config.vm.box      = 'precise64'
  config.vm.box_url  = 'http://files.vagrantup.com/precise64.box'
  config.vm.hostname = 'django-vagrant'

  config.vm.network :private_network, ip: "192.168.1.111"

  config.vm.network :forwarded_port, guest: 8000, host: 8000

  # add a bit more memory, it never hurts. It's VM specific and we're using Virtualbox here.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end

  # Sync project folder
  config.vm.synced_folder "webapp/", "/home/vagrant/webapp", created:true

  config.vm.provision "ansible" do |ansible|
    ansible.playbook       = "devops/site.yml"
    ansible.inventory_path = "devops/hosts"
    ansible.limit = "all"
    #ansible.verbose = "vvv"
  end

end
