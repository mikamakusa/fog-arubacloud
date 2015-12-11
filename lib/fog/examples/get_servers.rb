require 'rubygems'
require 'fog/arubacloud'

service = Fog::Compute.new({
    :provider             => 'ArubaCloud',
    :arubacloud_username  => 'ARU-XXXX',
    :arubacloud_password  => 'XXXXXXXX'
})

servers = service.servers
servers.all
