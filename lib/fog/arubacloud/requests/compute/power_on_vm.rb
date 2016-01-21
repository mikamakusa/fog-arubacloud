#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'

module Fog
  module Compute
    class ArubaCloud
      class Real
        def power_on_vm(id)
          body = self.body('SetEnqueueServerStart').merge({:ServerId => "#{id}"})
          options = {
              :http_method => :post,
              :method => 'SetEnqueueServerStart',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("SetEnqueueServerStart time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Error::RequestError
          end
        end # power_on_vm
      end # Real

      class Mock
        def power_on_vm(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # power_on_vm
      end # Mock
    end # ArubaCloud
  end # Compute
end # Fog