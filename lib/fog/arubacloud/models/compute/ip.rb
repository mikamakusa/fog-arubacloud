#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/model'

module Fog
  module Compute
    class ArubaCloud
      class IP < Fog::Model
        identity :id, :aliases => 'ResourceId'

        attribute :gateway, :aliases => 'Gateway'
        attribute :server , :aliases => 'ServerId'
        attribute :address, :aliases => 'Value'
        attribute :netmask, :aliases => 'SubNetMask'
        attribute :product_id, :aliases => 'ProductId'
        attribute :loadbalancer_id, :aliases => 'LoadBalancerID'
        ignore_attributes :CompanyId, :ResourceType

        def initialize(attributes = {})
          @service = attributes[:service]
          super
        end

        def purchase
          @service.purchase_ip
        end

        def remove
          requires :id
          @service.remove_ip(id)
        end

      end #IP
    end #ArubaCloud
  end #Compute
end #Fog