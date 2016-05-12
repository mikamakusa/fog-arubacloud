#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/models/compute/snapshot'

module Fog
  module Compute
    class ArubaCloud
      class Snapshots < Fog::Collection
        model Fog::Compute::ArubaCloud::Snapshots
      end
    end
  end
end