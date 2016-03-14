
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/model'
require 'fog/arubacloud/error'

module Fog
  module Compute
    class ArubaCloud
      class NetworkAdapter < Fog::Model
        identity :id, :aliases => 'Id'

        attribute :mac_address, :aliases => 'MacAddress', :type => String
        attribute :adapter_type, :aliases => 'NetworkAdapterType', :type => Integer
        attribute :server_id, :aliases => 'ServerId', :type => Integer
        attribute :vlan, :aliases => 'VLan', :type => Integer

        has_many :ip_addresses, :ips, aliases: 'IPAddresses'
      end
    end
  end
end
