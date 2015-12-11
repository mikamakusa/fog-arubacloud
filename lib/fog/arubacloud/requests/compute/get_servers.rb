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
        def get_servers
          body = {
              :ApplicationId => 'GetServers',
              :RequestId => 'GetServers',
              :SessionId => 'GetServers',
              :Username => @arubacloud_username,
              :Password => @arubacloud_password
          }
          get_servers_options = {
              :http_method => :post,
              :method => 'GetServers',
              :body => Fog::JSON.encode(body)
          }
          request(get_servers_options)
        end
      end
    end
  end
end