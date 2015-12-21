#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

module Fog
  module ArubaCloud
    module Errors
      class Error < Fog::Errors::Error
        attr_accessor :type, :error_point

        def initialize(message, type='n/a', error_point=nil)
          @type = type
          @error_point = error_point
          super(message)
        end
      end

      class NotFound < Error
      end

      class RequestError < Error
      end

      class BadParameters < Error
      end
    end
  end
end