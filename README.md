The vagrant bought some cooking tools and set up shop on the corner, now he's cookin'.

A simple way to test chef cookbooks, roles, bootstraps, knife plugins, anything you like.


Prerequisites
-------------
bundler - you really should already have this installed
`gem install bundler`

virtualbox - it's what's for dinner
https://www.virtualbox.org/wiki/Downloads

Instructions
------------

1. `git@github.com:agoddard/street-chef.git; cd street-chef`

2. `bundle install`

3. `librarian-chef install` (this will install the opscode community cookbooks which the chef-server bootstrap will need) 

4. `vagrant up`

5. Watch as your chef server is built and you get a few apps servers thrown in as tasty extras on the side.


Usage
-----

All knife commands will work from the street-chef directory, except 'knife ssh' (still working on this) so `vagrant ssh` will have to do for now.
When you're done, just `vagrant destroy` to shut down and delete the VMs.
