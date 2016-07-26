Vagrant.configure("2") do |config|

  config.vm.box      = 'precise64'
  config.vm.box_url  = 'http://files.vagrantup.com/precise64.box'
  config.vm.hostname = 'django-vagrant'

  config.vm.network :private_network, ip: "192.168.10.112"

  config.vm.network :forwarded_port, guest: 8000, host: 8000

  # add a bit more memory, it never hurts. It's VM specific and we're using Virtualbox here.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 512]
  end

  # Sync project folder
  config.vm.synced_folder "../djangoapps/app/", "/home/vagrant/app", created:true
  config.vm.synced_folder "../djangoapps/webapp/", "/home/vagrant/webapp", created:true
  #config.vm.synced_folder "bash/", "/home/vagrant/bash", created:true
  config.vm.synced_folder "../flaskapps/webapp/", "/home/vagrant/bazaar-flask", created:true
  config.vm.synced_folder "../flaskapps/freefi/", "/home/vagrant/freefi", created:true
  config.vm.synced_folder "../flaskapps/hostel/", "/home/vagrant/hostel", created:true
  config.vm.synced_folder "../djangoapps/pos/", "/home/vagrant/pos", created:true
  config.vm.synced_folder "../djangoapps/mehtab/", "/home/vagrant/mehtab", created:true


  config.vm.provision "ansible" do |ansible|
    ansible.playbook       = "devops/site.yml"
    ansible.inventory_path = "devops/hosts"
    ansible.limit = "all"
    #ansible.verbose = "vvv"
  end

end
