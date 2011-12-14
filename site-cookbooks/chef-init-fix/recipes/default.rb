#
# Cookbook Name:: chef-init-fix
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
#

%w{ chef-solr chef-expander chef-server }.each do |svc|
  link "/usr/bin/#{svc}" do
    to "#{node['languages']['ruby']['bin_dir']}/#{svc}"
  end
end

# Fix permissions on /var/run/chef so that chef launchers in /etc/init.d can write pid files.
execute "chown chef:chef #{node["chef_client"]["run_path"]};" do
  only_if "test -d #{node["chef_client"]["run_path"]};"
end
