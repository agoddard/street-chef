xRequire_plugin "network"

# Set default ipaddress to be eth1 address.  This is the interface vagrant uses for the user-provided ip.
iface = 'eth1'
if network["interfaces"][iface]
  Ohai::Log.debug("Using eth1 ipaddress for default ipadress")
  im = find_ip_and_mac(network["interfaces"][iface]["addresses"])
  ipaddress im.shift
  macaddress im.shift
  return if (ipaddress and macaddress)
end

