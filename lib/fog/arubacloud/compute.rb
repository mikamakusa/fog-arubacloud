#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

module Fog
  module Compute
    class ArubaCloud < Fog::Service
      class MissingRequiredParameter < Fog::Errors::Error
      end

      requires :arubacloud_username, :arubacloud_token

      recognizes :arubacloud_api_url, :arubacloud_default_datacenter

      model_path 'fog/arubacloud/models/compute'
      collection :servers
      model      :server

      request_path 'fog/arubacloud/requests/compute'
      request :create_vm
      request :power_on_vm
      request :power_off_vm
      request :delete_vm
      request :purchase_ip
      request :get_vm
      request :get_ip

      # Mock class to run a fake instance of the Service with no real connections.
      class Mock
        attr_accessor :arubacloud_default_datacenter

        def initialize(args)
          @vms = []
          @ips = []
        end

        def request(method, uri, json_scheme = {})
          _request
        end

        def _request
          raise Fog::Errors::MockNotImplemented
        end

      end

      class Real
        attr_accessor :arubacloud_default_datacenter

        def initialize(options={})
          @arubacloud_api_key = options[:arubacloud_api_key]
          @arubacloud_username = options[:arubacloud_username]
        end

        def request(method, uri, json_scheme)
          #TODO: Add base request method
        end
      end

    end
  end
end