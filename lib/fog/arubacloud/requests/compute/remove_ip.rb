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
        end # remove_ip
      end # Real

      class Mock
        def remove_ip(id)
          self.ips.select!{|i| !i.id.eql?(id)}
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # remove_ip
      end # Mock

    end # ArubaCloud
  end # Compute
end # Fog