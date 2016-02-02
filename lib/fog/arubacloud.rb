#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core'
require 'fog/json'


module Fog
  module Compute
    autoload :ArubaCloud, File.expand_path('../arubacloud/compute', __FILE__)

    def self.new(attributes)
      attributes.delete(:provider)
      Fog::Compute::ArubaCloud.new(attributes)
    end

  end

  module ArubaCloud
    extend Fog::Provider

    DEFAULT_API_VERSION = '2.9'
    DEFAULT_WS_ENDUSER_URL = "https://api.dc2.computing.cloud.it/WsEndUser/v#{DEFAULT_API_VERSION}/WsEndUser.svc/json"

    service(:compute, 'Compute')
  end
end
