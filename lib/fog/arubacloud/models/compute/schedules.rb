#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/collection'
require 'fog/arubacloud/models/compute/schedule'

module Fog
  module Compute
    class ArubaCloud
      class Schedules < Fog::Collection
        model Fog::Compute::ArubaCloud::Schedules
      end
    end
  end
end