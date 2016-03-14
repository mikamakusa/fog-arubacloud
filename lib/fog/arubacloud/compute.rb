#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'

module Fog
  module Compute
    class ArubaCloud < Fog::Service

      # Define global constant to enumerate service type (We will need them in Vagrant :P)
      PRO_HV    = 1
      PRO_VMW   = 2
      PRO_HV_LC = 3
      SMART     = 4

      recognizes :url
      requires :arubacloud_username, :arubacloud_password

      # Models
      model_path 'fog/arubacloud/models/compute'
      collection :servers
      model      :server
      collection :ips
      model      :ip
      collection :templates
      model      :template
      collection :disks
      model      :disk
      collection :network_adapters
      model      :network_adapter

      # Requests
      request_path 'fog/arubacloud/requests/compute'
      request :power_on_vm
      request :power_off_vm
      request :get_servers
      request :get_server_details
      request :delete_vm
      request :create_vm_pro
      request :create_vm_smart
      request :purchase_ip
      request :remove_ip
      request :get_purchased_ip_addresses
      request :get_hypervisors
      request :reinitialize_vm

      # Mock class to run a fake instance of the Service with no real connections.
      class Mock < Fog::ArubaCloud::Service
        def initialize(options={})
          @arubacloud_username = options[:arubacloud_username] || ''
          @arubacloud_password = options[:arubacloud_password] || ''
          @ws_enduser_url = options[:url] || Fog::ArubaCloud::DEFAULT_WS_ENDUSER_URL
        end

        # Return the base json object used by each request.
        # @param method [String] the name of the method to call.
        # @return [Hash] base scheme for json request.
        def body(method)
          {
              :ApplicationId => method,
              :RequestId => method,
              :Sessionid => method,
              :Username => @arubacloud_username,
              :Password => @arubacloud_password
          }
        end
      end #Mock

      class Real < Fog::ArubaCloud::Service
        def initialize(options={})
          @arubacloud_username = options[:arubacloud_username] || ''
          @arubacloud_password = options[:arubacloud_password] || ''
          @ws_enduser_url = options[:url] || Fog::ArubaCloud::DEFAULT_WS_ENDUSER_URL
        end

        # Return the base json object used by each request.
        # @param method [String] the name of the method to call.
        # @return [Hash] base scheme for json request.
        def body(method)
          {
              :ApplicationId => method,
              :RequestId => method,
              :Sessionid => method,
              :Username => @arubacloud_username,
              :Password => @arubacloud_password
          }
        end
      end #Real

    end #ArubaCloud
  end #Compute
end #Fog