#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/model'
require 'fog/arubacloud/error'

module Fog
  module Compute
    class ArubaCloud
      class Disk < Fog::Model
        attribute :size
        attribute :virtual_disk_type

        # Fake create method, it returns only an hash representing the json scheme of a disk
        # @return [Hash] hash object representing the disk
        # @raise [Fog::ArubaCloud::Errors::BadDiskSize]
        # @raise [Fog::ArubaCloud::Errors::BadDiskNumber]
        def create
          requires :size, :virtual_disk_type

          raise Fog::ArubaCloud::Errors::BadDiskSize.new('Maximum disk size: 500GB') unless
              size <= 500 # maximum disk size: 500GB
          raise Fog::ArubaCloud::Errors::BadDiskNumber.new('Only 4 disks are supported per VM') unless
              virtual_disk_type < 3 # only 4 disks are supported per VM
        end

        def save
          create
        end

        # Return an hash representation of the object in order to be used in json request
        def get_hash
          requires :size, :virtual_disk_type
          {
              :Size => size,
              :VirtualDiskType => virtual_disk_type
          }
        end

      end #Disk
    end #ArubaCloud
  end #Compute
end #Fog