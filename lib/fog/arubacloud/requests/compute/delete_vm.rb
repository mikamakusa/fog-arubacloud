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
        def delete_vm(id)
          body = self.body('SetEnqueueServerDeletion').merge({:ServerId => "#{id}"})
          delete_vm_options = {
              :http_method => :post,
              :method => 'SetEnqueueServerDeletion',
              :body => Fog::JSON.encode(body)
          }
          request(delete_vm_options)
        end
      end
    end
  end
end