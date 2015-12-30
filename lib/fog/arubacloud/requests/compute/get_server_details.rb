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

      class Real
        # Return the server details
        # @return [Excon::Response]
        def get_server_details(server_id)
          body = self.body('GetServerDetails').merge({:ServerId => server_id})
          options = {
              :http_method => :post,
              :method => 'GetServerDetails',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          puts "GetServerDetails time: #{time}"
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new(
                "Error during GetServerDetails request. Error message: \n#{response}"
            )
          end
        end # get_server_details
      end # Real

      class Mock
        def get_server_details(server_id)
          raise Fog::Errors::MockNotImplemented.new(
              'Mock not implemented. Feel free to contribute.'
          )
        end # get_server_details
      end # Mock

    end # ArubaCloud
  end # Compute
end # Fog
