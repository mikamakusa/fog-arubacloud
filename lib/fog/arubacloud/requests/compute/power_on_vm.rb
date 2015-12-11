#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

module Fog
  module Compute
    class ArubaCloud
      class Real
        def power_on_vm(id)
          body = {
              :ApplicationId => 'SetEnqueueServerStart',
              :RequestId => 'SetEnqueueServerStart',
              :SessionId => 'SetEnqueueServerStart',
              :Username => @arubacloud_username,
              :Password => @arubacloud_password,
              :ServerId => "#{id}"
          }
          power_on_options = {
              :http_method => :post,
              :method => 'SetEnqueueServerStart',
              :body => Fog::JSON.encode(body)
          }
        end
      end
    end
  end
end