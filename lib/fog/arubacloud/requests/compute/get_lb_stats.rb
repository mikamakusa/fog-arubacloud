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
        def get_lb_stats(data)
          body = self.body('GetLoadBalancerRuleStatistics').merge(
              :GetLoadBalancerLoads => {
                  :EndTime => data[:endtime],
                  :loadBalancerRuleID => data[:ruleid],
                  :StartTime => data[:starttime]
              }
          )
          options = {
              :http_method => :post,
              :method => 'GetLoadBalancerRuleStatistics',
              :body => Fog::JSON.encode(body)
          }

          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("GetLoadBalancerRuleStatistics time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error during the request.')
          end

        end # get_lb_stats
        class Mock
          def get_lb_stats
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # get_lb_stats
        end # Mock
      end # Real
    end # ArubaCloud
  end # Compute
end # Fog