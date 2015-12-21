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
        def remove_ip(id)
          body = self.body('SetRemoveIpAddress').merge(
              {:IpAddressResourceId => id}
          )
          options = {
              :http_method => :post,
              :method => 'SetRemoveIpAddress',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          puts "SetRemoveIpAddress time: #{time}"
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