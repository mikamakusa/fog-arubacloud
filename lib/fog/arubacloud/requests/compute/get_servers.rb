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
        def get_servers
          body = self.body('GetServers')
          options = {
              :http_method => :post,
              :method => 'GetServers',
              :body => Fog::JSON.encode(body)
          }
          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          puts "GetServer time: #{time}"
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new(response)
          end
        end # get_servers
      end # Real

      class Mock
        def get_servers
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true,
              'Value' => [
                  {
                      'Busy' => false,
                      'CPUQuantity' => 1,
                      'CompanyId' => 1,
                      'DatacenterId' => 2,
                      'HDQuantity' => 1,
                      'HDTotalSize' => 20,
                      'HypervisorServerType' => 2,
                      'HypervisorType' => 4,
                      'Name' => 'testfog1',
                      'OSTemplateId' => 415,
                      'RAMQuantity' => 1,
                      'ServerId' => 16763,
                      'ServerStatus' => 3,
                      'UserId' => 1856
                  }, {
                      'Busy' => false,
                      'CPUQuantity' => 1,
                      'CompanyId' => 1,
                      'DatacenterId' => 2,
                      'HDQuantity' => 2,
                      'HDTotalSize' => 50,
                      'HypervisorServerType' => 2,
                      'HypervisorType' => 2,
                      'Name' => 'testpro4504',
                      'OSTemplateId' => 60,
                      'RAMQuantity' => 1,
                      'ServerId' => 16779,
                      'ServerStatus' => 3,
                      'UserId' => 1856
                  }
              ]
          }
          response.body
        end # get_servers
      end # Mock

    end # ArubaCloud
  end # Compute
end # Fog