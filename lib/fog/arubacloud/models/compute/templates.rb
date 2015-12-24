#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/models/compute/template'


module Fog
  module Compute
    class ArubaCloud
      class Templates < Fog::Collection
        model Fog::Compute::ArubaCloud::Template

        # Returns list of Template
        # @return [Fog::Compute::ArubaCloud::Template] Retrieves the complete Templates list.
        # @raise [Fog::Compute::ArubaCloud::NotFound]
        # @note The filter parameter on the method is just to maintain compatibility with other providers that support
        #       filtering.
        def all(filters = [])
          data = service.get_hypervisors
          objects = data["Value"]
          manipulated_objects = Array.new
          objects.each do |h|
            hv_type = h['HypervisorType']
            h['Templates'].each do |t|
              t.merge!({'hypervisor' => hv_type})
              manipulated_objects << t
            end
          end
          load(manipulated_objects)
        end

        # Retrieves Single Template Item
        # @param [String] template_id for server to be returned.
        # @return [Fog::Compute::ArubaCloud::Template]
        def get(template_id)
          # TODO: Implement retrieve of a single template
        end

      end
    end
  end
end