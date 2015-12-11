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
        def power_off_vm(id)
          body = {
              :ApplicationId => 'SetEnqueueServerStop',
              :RequestId => 'SetEnqueueServerStop',
              :SessionId => 'SetEnqueueServerStop',
              :Username => @arubacloud_username,
              :Password => @arubacloud_password,
              :ServerId => "#{id}"
          }
          power_off_options = {
              :http_method => :post,
              :method => 'SetEnqueueServerStop',
              :body => Fog::JSON.encode(body)
          }
          request(power_off_options)
        end
      end
    end
  end
end