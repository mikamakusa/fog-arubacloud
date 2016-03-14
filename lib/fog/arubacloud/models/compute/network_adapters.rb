#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/models/compute/network_adapter'


module Fog
  module Compute
    class ArubaCloud
      class NetworkAdapters < Fog::Collection
        model Fog::Compute::ArubaCloud::NetworkAdapter
      end
    end
  end
end
