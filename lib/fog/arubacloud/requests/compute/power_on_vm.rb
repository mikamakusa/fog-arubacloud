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
        def power_on_vm(id)
          body = self.body('SetEnqueueServerStart').merge({:ServerId => "#{id}"})
          power_on_options = {
              :http_method => :post,
              :method => 'SetEnqueueServerStart',
              :body => Fog::JSON.encode(body)
          }
          request(power_on_options)
        end
      end
    end
  end
end