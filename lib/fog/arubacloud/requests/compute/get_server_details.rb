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
      # noinspection RubyResolve
      class Real
        def get_server_details(server_id)
          body = {
              :ApplicationId => 'GetServerDetails',
              :RequestId => 'GetServerDetails',
              :SessionId => 'GetServerDetails',
              :Username => @arubacloud_username,
              :Password => @arubacloud_password,
              :ServerId => server_id
          }
          get_server_detail_options = {
              :http_method => :post,
              :method => 'GetServerDetails',
              :body => Fog::JSON.encode(body)
          }
          request(get_server_detail_options)
        end

        class Mock
          raise Not
        end
      end
    end
  end
end
