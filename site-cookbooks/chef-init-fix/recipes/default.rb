#
# Cookbook Name:: chef-init-fix
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{ chef-solr chef-expander chef-server }.each do |svc|
  link "/usr/bin/#{svc}" do
    to "#{node['languages']['ruby']['bin_dir']}/#{svc}"
  end
end