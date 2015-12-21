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
        # Return the server details
        # @return [Ex]
        def get_server_details(server_id)
          body = self.body('GetServerDetails').merge({:ServerId => server_id})
          get_server_detail_options = {
              :http_method => :post,
              :method => 'GetServerDetails',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(get_server_detail_options)
          }
          puts "GetServerDetails time: #{time}"
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::NotFound
          end
        end

        class Mock
        end
      end
    end
  end
end
