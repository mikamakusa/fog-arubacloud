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
        def remove_loadbalancer(data)
          body = self.body('SetEnqueueLoadBalancerDeletion').merge(
              :LoadBalancerDeletionRequest => {
                  :loadBalancerID => data[:id]
              }
          )
          options = {
              :http_method => :post,
              :method => 'SetEnqueueLoadBalancerDeletion',
              :body => Fog::JSON.encode(body)
          }

          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("SetEnqueueLoadBalancerDeletion time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error during the Load Balancer deletion.')
          end
        end # remove_loadbalancer
        class Mock
          def remove_loadbalancer
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # remove_loadbalancer
        end # Mock
      end # Real
    end # ArubaCloud
  end # Compute
end # Fog