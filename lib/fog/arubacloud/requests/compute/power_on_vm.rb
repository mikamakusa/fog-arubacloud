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
          puts "SetEnqueueServerStart time: #{time}"
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Error::RequestError
          end
        end
      end
    end
  end
end