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

servers = service.create_pro_vm({:prova => 'ciao', :ipv4 => {:id => 100}})

