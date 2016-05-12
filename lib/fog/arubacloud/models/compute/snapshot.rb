#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/compute/models/snapshot'
require 'fog/arubacloud/error'

module Fog
  module Compute
    class ArubaCloud
      class Snapshot < Fog::Compute::Snapshot
        CREATING = 'Create'
        APPLYING = 'Restore'
        DELETING = 'Delete'
        identity :id, :aliases => 'id'

        attribute :ServerId, :aliases => 'serverid'
        attribute :SnapshotOperation, :aliases => 'Snapshot Operation'

        def initialize(attributes = {})
          @service = attributes[:service]
          if attributes[:name].nil?
            'operation impossible'
          end
        end
        def create
          requires :ServerId
          data = :attributes
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # Create
        def apply
          requires :ServerId
          data = :attributes
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # Apply
        def delete
          requires :ServerId
          data = :attributes
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # Delete
      end
    end
  end
end