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


  end
end
