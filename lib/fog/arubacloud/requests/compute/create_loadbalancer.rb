#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'
require 'fog/arubacloud/error'
require 'benchmark'


module Fog
  module Compute
    class ArubaCloud
      class Real
        def create_loadbalancer(data)
          body = self.body('SetEnqueueLoadBalancerCreation').merge(
                :LoadBalancerCreationRequest => {
                    :name => data[:name],
                    :rules => data[:rules],
                    :ipAddressesResourceId => data[:ipaddressesresourceid]
                }
          )
          options = {
              :http_method => :post,
              :method => 'SetEnqueueLoadBalancerCreation',
              :body => Fog::JSON.encode(body)
          }

          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("SetEnqueueLoadBalancerCreation time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error during the Load Balancer creation.')
          end

        end # create_loadbalancer
        class Mock
          def create_loadbalancer
            raise Fog::Errors::MockNotImplemented.new(
                'Mock not implemented. Feel free to contribute.'
            )
          end # create_loadbalancer
        end # Mock
      end # Real
    end # ArubaCloud
  end # Compute
end # Fog