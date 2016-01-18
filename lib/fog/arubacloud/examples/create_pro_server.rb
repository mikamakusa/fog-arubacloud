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

# Create a Pro VM
## Create first disk
disk0 = service.disks.create({
                                 :size => 20,
                                 :virtual_disk_type => 0
                             }).get_hash
## Create second disk
disk1 = service.disks.create({
                                 :size => 30,
                                 :virtual_disk_type => 1
                             }).get_hash
## Create the Array containing both disks
disks = [disk0, disk1]

## Create the virtual machine
server = service.servers.create({
                                    :name           => "testpro#{rnd_string}",
                                    :vm_type        => 'pro',
                                    :admin_passwd   => 'Prova123',
                                    :cpu            => 1,
                                    :memory         => 1,
                                    :template_id    => 60,  # ac_Centos6_web_x64_3_1
                                    :disks          => disks
                                })