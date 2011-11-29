license          "Apache 2.0"
description      "Distributes ohai plugins for vagrant chef nodes"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

recipe "vagrant-ohai::default", "Distributes a directory of custom ohai plugins"

attribute "vagrant-ohai/plugin_path",
  :display_name => "Vagrant Ohai Plugin Path",
  :description => "Distribute plugins to this path.",
  :type => "string",
  :required => "optional",
  :default => "/etc/chef/vagrant_ohai_plugins"
