#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'rubygems'
require 'fog/arubacloud'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: get_servers.rb [options]'
  opts.on('-uUSERNAME', '--username=USERNAME', 'ArubaCloud Username') { |n| options[:username] = n}
  opts.on('-pPASSWORD', '--password=PASSWORD', 'ArubaCloud Password') { |p| options[:password] = p}
end.parse!

service = Fog::Compute.new({
    :provider             => 'ArubaCloud',
    :arubacloud_username  => options[:username],
    :arubacloud_password  => options[:password]
})

servers = service.servers
servers.all.each do |server|
  server.get_server_details
  puts server.id
  puts server.name
end
