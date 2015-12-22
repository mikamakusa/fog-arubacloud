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
        # Create a new VM: Smart or Pro type.
        # @param [String] type (pro or smart) type of server
        # @param [String] name name of the server
        # @param [String] admin_password server administrative password
        # @param [Int] cpu amount of vcpu
        # @param [Int] ram amount of ram in GB
        # @param [String] template_id id of template to use
        # @param [String] ipv4_id if present, the ID of the ip resource to associate
        # @param [String] size (small|medium|big|huge) type of smart VM
        # @param [String] note Metadata for VM
        # @return []
        def create_vm(data)
          vm_type = data[:vm_type].to_s.downcase || 'pro'

          if vm_type.eql? 'pro'
            body = self.body('SetEnqueueServerCreation').merge(
                {
                    :Server => {
                        :AdministratorPassword => data[:admin_passwd],
                        :CPUQuantity => data[:cpu],
                        :Name => data[:name],
                        :NetworkAdaptersConfiguration => [],
                        :Note => 'Created by Fog Cloud.',
                        :OSTemplateId => data[:template_id],
                        :RAMQuantity => data[:ram],
                        :VirtualDisks => []
                    }
                }
            )
            unless data[:ipv4_id].nil?
              body[:Server][:NetworkAdaptersConfiguration] << {
                  :PrimaryIPAddress => true,
                  :PublicIpAddressResourceId => data[:ipv4_id]
              }
            end
          elsif vm_type.eql? 'smart'
            body = self.body('SetEnqueueServerCreation').merge(
                {
                    :Server => {
                        :AdministratorPassword => data[:admin_password],
                        :Name => data[:name],
                        :SmartVMWarePackageID => data[:size] || 'small',
                        :Note => data[:note] || 'Created by Fog Cloud.',
                        :OSTemplateId => data[:template_id]
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

          request(options)
        end
      end

      class Mock
        def create_vm(data)
          response = Excon::Response.new
          response.status = 201
          response.body = {
              # TODO: Implement standard response
          }
          response
        end
      end

    end # ArubaCloud
  end # Compute
end # Fog