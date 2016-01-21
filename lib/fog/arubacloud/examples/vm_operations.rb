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

# Poweroff all vm in a datacenter
#servers.each do |s|
#  s.power_off
#end

# Delete all vm in a datacenter
servers.each do |s|
  begin
    s.delete
  rescue
    next
  end
end

# Release all unassociated IP
# ips = service.ips
# ips.each do |i|
#   puts i.address
#   i.remove
# end