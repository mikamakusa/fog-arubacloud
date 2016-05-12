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
        # Create a new snapshot of a VM
        def create_snapshot(data)
          (service.servers).all.each do |server|
            id = server.id if (server.name).include? data[:name]
          end
          body = self.body('SetEnqueueServerSnapshot').merge(
              {
                  :Snapshot => {
                      :ServerId => id,
                      :SnapshotOperationTypes => 'Create'
                  }
              }
          )
          options = {
              :http_method => :post,
              :method => 'SetEnqueueServerSnapshot',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("SetEnqueueServerSnapshot time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new(response)
          end
        end #Create_snapshot
      end #Real
      class Mock
        def create_snapshot
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end
      end
    end #ArubaCloud
  end #Compute
end #Fog