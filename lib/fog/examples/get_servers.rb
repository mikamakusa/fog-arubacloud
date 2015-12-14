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
    :arubacloud_username  => 'ARU-XXXX',
    :arubacloud_password  => 'XXXXXXXXXX'
})

servers = service.servers
servers.all.each do |server|
  puts server.id
  puts server.name
end
