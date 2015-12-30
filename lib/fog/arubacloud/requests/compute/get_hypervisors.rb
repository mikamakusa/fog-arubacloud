#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
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
        def get_hypervisors
          body = self.body('GetHypervisors')
          options = {
              :http_method => :post,
              :method => 'GetHypervisors',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          puts "GetHypervisors time: #{time}"
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error in request.')
          end
        end # get_hypervisors
      end # Real

      class Mock
        # Due to the length of the response body, I actually decided to not implement
        # the mock method of the request. I will introduce it in the next version after structuring the mock
        # objects in a more reasonable way.
        def get_hypervisors
          raise Fog::Errors::MockNotImplemented.new(
              'Mock object for get_hypervisor not present, read code comments for details.'
          )
        end # get_hypervisors
      end # Mock

    end # ArubaCloud
  end # Compute
end # Fog