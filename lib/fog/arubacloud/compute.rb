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
      requires :arubacloud_username, :arubacloud_password

      # Models
      model_path 'fog/arubacloud/models/compute'
      collection :servers
      model      :server
      collection :ips
      model      :ip
      collection :templates
      model      :template

      # Requests
      request_path 'fog/arubacloud/requests/compute'
      request :power_on_vm
      request :power_off_vm
      request :get_servers
      request :get_server_details
      request :delete_vm
      request :create_vm
      request :purchase_ip
      request :remove_ip
      request :get_purchased_ip_addresses
      request :get_hypervisors

      # Mock class to run a fake instance of the Service with no real connections.
      class Mock < Fog::ArubaCloud::Service
        def initialize(options={})
          @arubacloud_username = options[:arubacloud_username] || ''
          @arubacloud_password = options[:arubacloud_password] || ''
          @ws_enduser_url = options[:url] || Fog::ArubaCloud::DEFAULT_WS_ENDUSER_URL
        end
      end

      class Real < Fog::ArubaCloud::Service
        def initialize(options={})
          @arubacloud_username = options[:arubacloud_username] || ''
          @arubacloud_password = options[:arubacloud_password] || ''
          @ws_enduser_url = options[:url] || Fog::ArubaCloud::DEFAULT_WS_ENDUSER_URL
        end

        def body(method)
          {
              :ApplicationId => method,
              :RequestId => method,
              :Sessionid => method,
              :Username => @arubacloud_username,
              :Password => @arubacloud_password
          }
        end
      end

    end
  end
end