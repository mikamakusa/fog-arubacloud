#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/models/compute/server'


module Fog
  module Compute
    class ArubaCloud
      class Servers < Fog::Collection
        model Fog::Compute::ArubaCloud::Server

        # Returns list of servers
        # @return [Fog::Compute::ArubaCloud::Servers] Retrieves a list servers.
        # @raise [Fog::Compute::ArubaCloud::NotFound]
        # @note The filter parameter on the method is just to maintain compatibility with other providers that support
        #       filtering.
        def all(filters = [])
          data = service.get_servers
          objects = data['Value']
          load(objects)
        end

        # Retrieves server
        # @param [String] server_id for server to be returned.
        # @return [Fog::Compute::ArubaCloud::Server]
        def get(server_id)
          data = service.get_server_details(server_id)
          objects = data['Value']
          load(objects)
        end

      end
    end
  end
end