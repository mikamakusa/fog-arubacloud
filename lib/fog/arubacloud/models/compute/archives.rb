#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/models/compute/archive'

module Fog
  module Compute
    class ArubaCloud
      class Archives < Fog::Collection
        model Fog::Compute::ArubaCloud::Archives
      end
    end
  end
end