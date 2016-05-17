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
        def get_loadbalancer(data)
          body = self.body('GetLoadBalancers').merge(
              :GetLoadBalancers => {
                  :loadBalancerID => data[:id]
              }
          )
          options = {
              :http_method => :post,
              :method => 'GetLoadBalancers',
              :body => Fog::JSON.encode(body)
          }

          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("GetLoadBalancers time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error during the Load Balancer deletion.')
          end
        end # get_loadbalancer
        class Mock
          def get_loadbalancer
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # create_loadbalancer
        end # Mock
      end # Real
    end # ArubaCloud
  end # Compute
end # Fog