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
        def purchase_ip
          body = self.body('SetPurchaseIpAddress')
          options = {
              :http_method => :post,
              :method => 'SetPurchaseIpAddress',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          puts "SetPurchaseIpAddress time: #{time}"
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