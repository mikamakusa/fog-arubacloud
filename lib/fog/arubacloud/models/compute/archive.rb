#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/model'
require 'fog/arubacloud/error'


module Fog
  module Compute
    class ArubaCloud
      class Archive < Fog::Model
        ARCHIVE = 'Archive'
        RESTORE = 'Restore'
        identity :id, :aliases => 'id'

        attribute :ServerId, :aliases => 'serverid'
        attribute :ArchiveOperation, :aliases => 'ArchiveOperation'
        attribute :CPUQuantity, :aliases => 'CPUQuantity'
        attribute :RAMQuantity, :aliases => 'RAMQuantity'

        def initialize(attributes = {})
          @service = attributes[:service]
          if attributes[:name].nil?
            'operation impossible'
          end
        end # initialize

        def archive
          requires :ServerId
          data = :attributes
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # archive

        def restore
          requires :ServerId
          data = :attributes
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # restore

      end # Archive
    end # ArubaCloud
  end # Compute
end # Fog