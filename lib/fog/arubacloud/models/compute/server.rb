#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/compute/models/server'

module Fog
  module Compute
    class ArubaCloud
      class Server < Fog::Compute::Server
        CREATING = 1
        STOPPED = 2
        RUNNING = 3
        ARCHIVED = 4
        DELETED = 5

        # This is the instance ID which is unique per Datacenter
        identity :id, :aliases => 'ServerId'

        attribute :name, :aliases => 'Name'
        attribute :state, :aliases => 'ServerStatus'
        attribute :memory, :aliases => 'RAMQuantity'
        attribute :cpu, :aliases => 'CPUQuantity', :type => :string
        attribute :hypervisor, :aliases => 'HypervisorType'
        attribute :datacenter_id, :aliases => 'DatacenterId'
        attribute :template_id, :aliases => 'OSTemplateId'
        attribute :hd_qty, :aliases => 'HDQuantity'
        attribute :hd_total_size, :aliases => 'HDTotalSize'
        attribute :admin_password
        attribute :vm_type
        attribute :ipv4_addr
        attribute :package_id

        def initialize(attributes = {})
          @service = attributes[:service]

          if attributes[:vm_type].nil?
            self.vm_type = 'smart' if hypervisor.is? '4' || 'pro'
          end

          super
        end

        def save
          if persisted?
            update
          else
            create
          end
        end

        def create
          requires :name, :cpu, :memory, :admin_password, :vm_type, :package_id
          data = attributes
          response = service.create_vm(data)
          # Create method doesn't return a json containing the server data, only a true/false.
          # new_attributes = response['Value']
          # merge_attributes(new_attributes)
        end

        def get_server_details
          requires :id
          response = service.get_server_details(id)
          new_attributes = response['Value']
          merge_attributes(new_attributes)
        end

        def power_off
          requires :id
          @service.power_off_vm(id)
        end

        def power_on
          requires :id
          @service.power_on_vm(id)
        end

        def delete
          requires :id
          state == STOPPED ? service.delete_vm(id) : raise(Exception)
        end

      end
    end
  end
end