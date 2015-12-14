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
        def create_pro_vm(parameters)


          body = self.body('SetEnqueueServerCreation').merge(
              {
                  :Server => {
                      :AdministratorPassword => parameters[:admin_passwd],
                      :CPUQuantity => parameters[:cpu_quantity],
                      :Name => parameters[:name],
                      :NetworkAdaptersConfiguration => [],
                      :Note => 'Created by Fog Cloud.',
                      :OSTemplateId => parameters[:template_id],
                      :RAMQuantity => parameters[:ram],
                      :VirtualDisks => []
                  }
              }
          )

          power_off_options = {
              :http_method => :post,
              :method => 'SetEnqueueServerCreation',
              :body => Fog::JSON.encode(body)
          }
          request(power_off_options)
        end
      end
    end
  end
end