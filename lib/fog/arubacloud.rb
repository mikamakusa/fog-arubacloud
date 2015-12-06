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
    autoload :Arubacloud, File.expand_path('../arubacloud/compute', __FILE__)
  end

  module Arubacloud
    extend Fog::Provider

    service(:compute, 'Compute')

    AC_API_URL = 'https://api.dc1.computing.cloud.it/WsEndUser/v2.9/WsEndUser.svc/json'
  end
end
