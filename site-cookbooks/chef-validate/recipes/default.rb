#
# Cookbook Name:: chef-validate
# Recipe:: default
#
# Copyright 2011, Woods Hole Marine Biological Laboratory
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


directory "/vagrant/private" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end



directory "/root/.chef" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

# setup webui client
execute "validation-pem copy" do
  command "sudo cp /etc/chef/validation.pem /etc/chef/webui.pem ~/.chef"
  creates "/etc/chef/webui.pem"
end

execute "send validation-pem to host" do
  command "rm -rf /vagrant/private/validation.pem"
  command "sudo cp /etc/chef/validation.pem /vagrant/private/validation.pem"
  action :run
end


execute "create initial client" do
  command "knife configure -i --defaults -y -r '/root/repo'"
  creates "/root/.chef/knife.rb"
  action :run
end


# setup a default workstation client for knife
execute "vagrant-client" do
  command "knife client create workstation -n -a --defaults -f /root/.chef/workstation.pem -d"
  creates "/root/.chef/workstation.pem"
  action :run
end

# make the workstation.pem accessible to the workstation
execute "copy-workstation-pem" do
  command "cp /root/.chef/workstation.pem /vagrant/private/workstation.pem"
  action :run
end

