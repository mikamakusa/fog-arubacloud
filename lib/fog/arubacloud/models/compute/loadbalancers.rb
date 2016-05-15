#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require '/fog/core/collection'
require 'fog/arubacloud/models/compute/loadbalancer'


module Fog
  module Compute
    class ArubaCloud
      class LoadBalancers < Fog::Collection
        model Fog::Compute::ArubaCloud::LoadBalancers
      end # Load Balancers
    end # ArubaCloud
  end # Compute
end # Fog