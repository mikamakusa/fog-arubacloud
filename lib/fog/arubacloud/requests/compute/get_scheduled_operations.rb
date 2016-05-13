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
        def get_scheduled_operations(datestart, dateend)
          body = self.body('GetScheduledOperations').merge({:dateStart => datestart, :dateEnd => dateend})
          options = {
              :http_method => :post,
              :method => 'GetScheduledOperations',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("GetScheduledOperations time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error in request.')
          end
        end # get_scheduled_operations

        class Mock
          def get_scheduled_operations
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # get_scheduled_operations
        end # Mock
      end # Real
    end # ArubaCloud
  end # Compute
end # Fog