Vagrant::Config.run do |config|
  config.vm.define :chef do |chef_config|
    chef_config.vm.host_name = 'chef.streetchef.local'
    chef_config.vm.network "44.44.44.10"
    chef_config.vm.box = "ubuntu-lucid-32"
    chef_config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
    chef_config.vm.provision :chef_solo do |chef|
      chef.run_list.clear
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.add_recipe("chef-init-fix")
      chef.add_recipe("apt")
      chef.add_recipe("build-essential")
      chef.add_recipe("chef::bootstrap_server")
      chef.add_recipe("chef-validate")
      chef.add_recipe("chef-client::service")
      chef.add_recipe("vagrant-ohai")
      chef.json={
      :chef=> {
        :server_url=> "http://44.44.44.10:4000",
        :webui_enabled=> true,
        :init_style => "init"
      }
      }
    end
  end
#
#example clients
  config.vm.define :app1 do |app1config|
    app1config.vm.host_name = 'app1.streetchef.local'
    app1config.vm.network "44.44.44.11"
    app1config.vm.box = "ubuntu-lucid-32"
    app1config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
    app1config.vm.provision :chef_client do |chef|
      chef.chef_server_url = "http://44.44.44.10:4000"
      chef.validation_client_name = "chef-validator"
      chef.validation_key_path = "private/validation.pem"
    end
  end

  config.vm.define :app2 do |app2config|
    app2config.vm.host_name = 'app2.streetchef.local'
    app2config.vm.network "44.44.44.12"
    app2config.vm.box = "ubuntu-lucid-32"
    app2config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
    app2config.vm.provision :chef_client do |chef|
      chef.chef_server_url = "http://44.44.44.10:4000"
      chef.validation_client_name = "chef-validator"
      chef.validation_key_path = "private/validation.pem"
    end
  end

end
