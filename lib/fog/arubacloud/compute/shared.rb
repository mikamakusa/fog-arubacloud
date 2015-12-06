#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

module Fog
  module ArubaCloud
    module Compute

      # The Shared module consists of code that was duplicated between the Real and Mock implementations.
      module Shared
        # Create a new instance of the ArubaCloud Compute service
        #
        # @param [Hash] options
        # @option options [String] :arubacloud_api_url
        #  Override the default (or configured) API endpoint
        # @option options [String] :arubacloud_username
        #  Username for user based auth
        # @option options [String] :arubacloud_password
        #  Password for user based auth
        def initialize(options)
          @api_url = options[:arubacloud_api_url] || AC_API_URL
          @credentials = { username: options[:arubcloud_username], password: options[:arubacloud_password] }
        end
      end
    end
  end
end