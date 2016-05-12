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
        def restore_vm(data)
          (service.servers).all.each do |server|
            id = server.id if (server.name).include? data[:name] and (server.vm_type).include? 'pro'
          end
          body = self.body('SetEnqueueServerRestore').merge(
              {
                  :ServerRestore  => {
                      :ServerId => id,
                      :CPUQuantity  => cpu,
                      :RAMQuantity => memory
                  }
              }
          )
          options = {
              :http_method => :post,
              :method => 'SetEnqueueServerRestore',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("SetEnqueueServerRestore time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new(response)
          end

        end # restore_vm
      end # Real
      class Mock
        def restore_vm
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # restore_vm
      end # Mock
    end # ArubaCloud
  end # Compute
end # Fog