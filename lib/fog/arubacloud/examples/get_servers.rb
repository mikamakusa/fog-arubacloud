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

servers = service.servers
servers.all.each do |server|
  server.get_server_details
  puts server.id
  puts server.name
end
