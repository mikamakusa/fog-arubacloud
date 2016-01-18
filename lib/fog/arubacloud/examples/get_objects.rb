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

# Retrieve purchased IP list.
# ips = service.ips
# ips.each { |ip| puts ip.address }

# Retrieve template list
# Hypervisor Types:
#  1 -> Microsoft Hyper-V - Cloud Pro
#  2 -> VMWare - Cloud Pro
#  3 -> Microsoft Hyper-V Low Cost - Cloud Pro
#  4 -> VMWare - Cloud Smart
templates = service.templates
# Filter only smart templates
smart_templates = templates.select { |template| template.hypervisor.eql?(4) && template.enabled }
# Filter only templates which contains Centos in the name
centos_smart = smart_templates.select { |template| template.name.include?('Centos')}
centos_smart.each do |t|
  puts t.name
  puts t.id
end