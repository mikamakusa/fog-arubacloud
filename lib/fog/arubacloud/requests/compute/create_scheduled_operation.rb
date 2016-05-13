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
        def create_scheduled_operation(data)
          body = self.body('SetAddServerScheduledOperation').merge(
              :NewSchedulePlan => {
                  :FirstExecutionTime => data[:dateStart],
                  :LastExecutionTime => data[:endDate],
                  :OperationType => data[:OperationType],
                  :ServerID => data (:ServerId),
              }
          )
          options = {
              :http_method => :post,
              :method => 'SetAddServerScheduledOperation',
              :body => Fog::JSON.encode(body)
          }

          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("SetAddServerScheduledOperation time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new("Error during the Scheduled Operation creation. Object: \n#{body}\nError: \n#{response}")
          end
        end # create_scheduled_operation
        class Mock
          def create_scheduled_operation
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # create_scheduled_operation
        end # Mock
      end # Real
    end # ArubaCloud
  end # Compute
end # Fog