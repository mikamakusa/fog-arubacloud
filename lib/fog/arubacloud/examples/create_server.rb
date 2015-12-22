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

# Create a Smart VM
server = service.servers.create({
                                    :name           => 'testfog',
                                    :vm_type        =>'smart',
                                    :admin_password => 'Prova123',
                                    :cpu            => 1,
                                    :memory         => 1,
                                    :template_id    => '761',
                                    :package_id     => 'small'
                                })

# Create a Pro VM

