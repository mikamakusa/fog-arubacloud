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
smart_templates = templates.select { |template| template.hypervisor.eql?(2) && template.enabled }
# Filter only templates which contains Centos in the name
centos_smart = smart_templates.select { |template| template.name.include?('Centos')}
centos_smart.each do |t|
  puts t.name
  puts t.id
end