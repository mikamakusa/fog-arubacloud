#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'
require 'benchmark'

module Fog
  module Compute
    class ArubaCloud
      class Real
        # Create a new VM: Pro.
        # @param [String] name name of the server
        # @param [String] admin_password server administrative password
        # @param [Int] cpu amount of vcpu
        # @param [Int] ram amount of ram in GB
        # @param [String] template_id id of template to use
        # @param [String] ipv4_id if present, the ID of the ip resource to associate
        # @param [String] note Metadata for VM
        # @return [Excon::Response]
        def create_vm_pro(data)
          body = self.body('SetEnqueueServerCreation').merge(
                {
                    :Server => {
                        :AdministratorPassword => data[:admin_passwd],
                        :CPUQuantity => data[:cpu],
                        :Name => data[:name],
                        :NetworkAdaptersConfiguration => [],
                        :Note => 'Created by Fog Cloud.',
                        :OSTemplateId => data[:template_id],
                        :RAMQuantity => data[:memory],
                        :VirtualDisks => []
                    }
                }
            )
            unless data[:ipv4_id].nil?
              body[:Server][:NetworkAdaptersConfiguration] << {
                  :NetworkAdapterType => 0,
                  :PublicIpAddresses => [{
                      :PrimaryIPAddress => 'true',
                      :PublicIpAddressResourceId => data[:ipv4_id]
                  }]
              }
            end
            unless data[:disks].nil? && data[:disks].instance_of?(Array)
              data[:disks].each { |d| body[:Server][:VirtualDisks] << d}
            end

          options = {
              :http_method => :post,
              :method => 'SetEnqueueServerCreation',
              :body => Fog::JSON.encode(body)
          }

          response = nil
          time = Benchmark.realtime {
            response = request(options)
          }
          Fog::Logger.debug("SetEnqueueServerCreation time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new("Error during the VM creation. Object: \n#{body}\nError: \n#{response}")
          end

        end
      end

      class Mock
        def create_vm_pro(data)
          response = Excon::Response.new
          response.status = 201
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end
      end

    end # ArubaCloud
  end # Compute
end # Fog