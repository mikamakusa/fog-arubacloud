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
        def get_lb_loads(data)
          body = self.body('GetLoadBalancerLoads').merge(
              :GetLoadBalancerLoads => {
                  :EndTime => data[:endtime],
                  :LoadBalancerID => data[:id],
                  :StartTime => data[:starttime]
              }
          )
          options = {
              :http_method => :post,
              :method => 'GetLoadBalancerLoads',
              :body => Fog::JSON.encode(body)
          }

          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("GetLoadBalancerLoads time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error during the request.')
          end

        end # get_lb_loads
        class Mock
          def get_lb_loads
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # get_lb_loads
        end # Mock
      end # Real
    end # ArubaCloud
  end # Compute
end # Fog