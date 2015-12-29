#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'rubygems'
require 'fog/arubacloud'

service = Fog::Compute.new({
                               :provider             => 'ArubaCloud',
                               :arubacloud_username  => 'XXX-XXXX',
                               :arubacloud_password  => 'XXXXXXX'
                           })

#servers = service.servers

# Poweroff all vm in a datacenter
#servers.each do |s|
#  s.power_off
#end

# Delete all vm in a datacenter
#servers.each do |s|
#  s.delete
#end

# Release all unassociated IP
ips = service.ips
ips.each do |i|
  i.remove
end