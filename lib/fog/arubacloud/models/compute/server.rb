#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/compute/models/server'

module Fog
  module Compute
    class ArubaCloud
      class Server < Fog::Compute::Server
        CREATING = 1
        STOPPED = 2
        RUNNING = 3
        ARCHIVED = 4
        DELETED = 5

        # This is the instance ID which is unique per Datacenter
        identity :id

        attribute :name
        attribute :state
        attribute :memory
        attribute :vcpus
        attribute :disk
        attribute :networks

        def initialize(attributes = {})
          @service = attributes[:service]
        end

        def public_ip_address
          ipv4_address
        end

        def ipv4_address
          network
        end

        def power_off

        end

        def power_on

        end

        def delete
          if state != STOPPED

          end
        end

      end
    end
  end
end