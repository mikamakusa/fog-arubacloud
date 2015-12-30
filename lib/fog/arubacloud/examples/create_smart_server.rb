#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'rubygems'
require 'fog/arubacloud'
require 'securerandom'

# Fog.mock!
service = Fog::Compute.new({
                               :provider             => 'ArubaCloud',
                               :arubacloud_username  => 'XXX-XXXX',
                               :arubacloud_password  => 'XXXXXXX'
                           })

## Generate random string to append to vm name
rnd_string = SecureRandom.hex(2)

# Create a Smart VM
server = service.servers.create({
                                    :name           => 'testfog1',
                                    :vm_type        => 'smart',
                                    :admin_passwd   => 'Prova123',
                                    :cpu            => 1,
                                    :memory         => 1,
                                    :template_id    => '415',
                                    :package_id     => 1
                                })