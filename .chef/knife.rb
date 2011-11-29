log_level                :info
log_location             STDOUT
node_name                'workstation'
client_key               '../private/workstation.pem'
validation_client_name   'chef-validator'
validation_key           '../private/validation.pem'
chef_server_url          'http://192.168.234.10:4000'
cache_type               'BasicFile'
cache_options( :path => 'checksums' )
cookbook_path     ["cookbooks", "site-cookbooks"]
