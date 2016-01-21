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

      class VmStatus < Error

      end

      class BadDiskSize < Error

      end

      class BadDiskNumber < Error

      end

      class InvalidStateException < ::RuntimeError
        attr_reader :desired_state
        attr_reader :current_state

        def initialize(desired_state, current_state)
          @desired_state = desired_state
          @current_state = current_state
        end
      end

      class InvalidServerStateException < InvalidStateException
        def to_s
          "Server should have transitioned to '#{desired_state}' not '#{current_state}'"
        end
      end

    end
  end
end