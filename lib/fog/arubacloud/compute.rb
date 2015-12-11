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

      # Requests
      request_path 'fog/arubacloud/requests/compute'
      request :power_on_vm
      request :get_servers


      # Mock class to run a fake instance of the Service with no real connections.
      class Mock < Fog::ArubaCloud::Service
        def initialize(options={})
          @arubacloud_username = options[:arubacloud_username] || ''
          @arubacloud_password = options[:arubacloud_password] || ''
          @ws_enduser_url = options[:url] || Fog::ArubaCloud::DEFAULT_WS_ENDUSER_URL
        end

        def send_request(options)
          body = options[:body] || {}
          status = options[:status] || 200
          headers = options[:headers] || content

          response = Excon::Response.new(:body => body, :headers => headers, :status => status)
          if options.key?(:expects) && ![*options[:expects]].include?(response.status)
            raise(Excon::Errors.status_error(options, response))
          else
            response
          end
        end
      end

      class Real < Fog::ArubaCloud::Service
        def initialize(options={})
          @arubacloud_username = options[:arubacloud_username] || ''
          @arubacloud_password = options[:arubacloud_password] || ''
          @ws_enduser_url = options[:url] || Fog::ArubaCloud::DEFAULT_WS_ENDUSER_URL
        end
      end

    end
  end
end