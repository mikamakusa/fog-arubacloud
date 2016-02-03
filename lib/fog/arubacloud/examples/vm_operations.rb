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

# Fog.mock!
service = Fog::Compute.new({
                               :provider             => 'ArubaCloud',
                               :arubacloud_username  => options[:username],
                               :arubacloud_password  => options[:password]
                           })


servers = service.servers

# Poweroff and delete every VM in a Datacenter
servers.each do |s|
  puts("Powering Off and Deleting VM: #{s.name}...")
  next if s.state == Fog::Compute::ArubaCloud::Server::CREATING
  s.power_off unless s.stopped?
  until s.stopped?
    s.get_server_details
    puts(" --- Waiting for VM: #{s.name} to power off...")
  end
  begin
    puts(' --- Enqueued Server Deletion')
    s.delete
  rescue
    next
  end
end

# Delete all vm in a datacenter
#servers.each do |s|
#  begin
#    s.delete
#  rescue
#    next
#  end
#end

# Release all unassociated IP
# ips = service.ips
# ips.each do |i|
#   puts i.address
#   i.remove
# end