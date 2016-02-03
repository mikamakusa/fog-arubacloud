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
        # Create a new VM: Smart.
        # @param [String] name name of the server
        # @param [String] admin_password server administrative password
        # @param [String] template_id id of template to use
        # @param [Int] size
        # * 1 => small
        # * 2 => medium
        # * 3 => large
        # * 4 => extra-large
        # @param [String] note Metadata for VM
        # @return [Excon::Response]
        def create_vm_smart(data)
          body = self.body('SetEnqueueServerCreation').merge(
              {
                  :Server => {
                      :AdministratorPassword => data[:admin_passwd],
                      :Name => data[:name],
                      :SmartVMWarePackageID => data[:size] || 1,
                      :Note => data[:note] || 'Created by Fog Cloud.',
                      :OSTemplateId => data[:template_id]
                  }
              }
          )

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
            raise Fog::ArubaCloud::Errors::RequestError.new("Error during the VM creation. Object: \n#{body}",
                                                            response=response)
          end
        end
      end

      class Mock
        def create_vm_smart(data)
          response = Excon::Response.new
          response.status = 201
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # create_vm_smart
      end # Mock

    end # ArubaCloud
  end # Compute
end # Fog