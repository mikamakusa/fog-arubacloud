#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'rubygems'
require 'fog/arubacloud'
require 'securerandom'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: get_servers.rb [options]'
  opts.on('-uUSERNAME', '--username=USERNAME', 'ArubaCloud Username') { |n| options[:username] = n}
  opts.on('-pPASSWORD', '--password=PASSWORD', 'ArubaCloud Password') { |p| options[:password] = p}
end.parse!

# Fog.mock!
service = Fog::Compute.new({
                               :provider             => 'ArubaCloud',
                               :arubacloud_username  => options[:username],
                               :arubacloud_password  => options[:password]
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
