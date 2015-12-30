#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'
require 'benchmark'

module Fog
  module Compute
    class ArubaCloud
      class Real
        # Reinitialize a Smart VM
        # @param id [String] the id of the virtual machine to reinitialize
        # @return response [Excon::Response]
        def reinitialize_vm(id)
          body = self.body('SetEnqueueReinitializeServer').merge({
                                                                     :ServerId => id
                                                                 })
          options = {
              :http_method => :post,
              :method => 'GetServers',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          puts "SetEnqueueReinitializeServer time: #{time}"
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError
          end
        end # reinitialize_vm
      end # Real

      class Mock
        def reinitialize_vm(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # reinitialize_vm
      end # Mock

    end # ArubaCloud
  end # Compute
end # Fog