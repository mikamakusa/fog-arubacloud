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

      # noinspection RubyResolve
      class Real
        def get_purchased_ip_addresses
          body = self.body('GetPurchasedIpAddresses')
          get_servers_options = {
              :http_method => :post,
              :method => 'GetPurchasedIpAddresses',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(get_servers_options)
          }
          puts "GetPurchasedIpAddresses time: #{time}"
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Error::RequestError
          end
        end
      end

      class Mock
        # TODO: Implement Mock Class
      end

    end
  end
end