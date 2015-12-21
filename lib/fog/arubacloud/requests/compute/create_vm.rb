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
        def create_vm(parameters)
          vm_type = parameters[:type].to_s.downcase || 'pro'

          if vm_type.is? 'pro'
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
            unless parameters[:ipv4].nil? || parameters[:ipv4][:id].nil?
              id = parameters[:ipv4][:id]
              body[:Server][:NetworkAdaptersConfiguration] << {
                  :PrimaryIPAddress => true,
                  :PublicIpAddressResourceId => id
              }
            end
          elsif vm_type.is? 'smart'
            body = self.body('SetEnqueueServerCreation').merge(
                {
                    :Server => {
                        :AdministratorPassword => parameters[:admin_passwd],
                        :Name => parameters[:name],
                        :SmartVMWarePackageID => parameters[:size] || 'small',
                        :Note => parameters[:note] || 'Created by Fog Cloud.',
                        :OSTemplateId => parameters[:template_id]
                    }
                }
            )
          else
            raise Fog::ArubaCloud::Error::BadParameters
          end


          options = {
              :http_method => :post,
              :method => 'SetEnqueueServerCreation',
              :body => Fog::JSON.encode(body)
          }

        end
      end
    end
  end
end