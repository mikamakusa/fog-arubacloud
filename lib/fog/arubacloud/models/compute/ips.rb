#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/models/compute/ip'

module Fog
  module Compute
    class ArubaCloud

      class Ips < Fog::Collection
        model Fog::Compute::ArubaCloud::IP

        # Returns list of Ip Addresses
        # @return [Fog::Compute::ArubaCloud::Ips]
        # @raise [Fog::ArubaCloud::Errors::NotFound]
        def all
          data = service.get_purchased_ip_addresses
          objects = data['Value']
          load(objects)
        end

        # Returns a single IpAddress object
        # @param ip [String]
        # @return [Fog::Compute::ArubaCloud::IP]
        # @raise [Fog::ArubaCloud::Errors::NotFound]
        def get(ip)
          # TODO: Implement single item retrieve
        end

        # Purchase a new IpAddress
        # @return [Hash] hash containing the response of the request
        # @raise [Fog::ArubaCloud::Errors::RequestError]
        def purchase
          self << new(service.purchase_ip['Value'])
        end

      end
    end
  end
end
