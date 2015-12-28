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

      class Disks < Fog::Collection
        model Fog::Compute::ArubaCloud::Disk

        # Dummy Method, only to maintain fog structure, it returns nothings.
        # @return [Nil]
        def all
        end

        # Another dummy method, it returns nothings.
        # @return [Nil]
        def get
        end
      end #Disks

    end #ArubaCloud
  end #Compute
end #Fog
