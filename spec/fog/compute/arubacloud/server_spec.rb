require 'spec_helper'
require 'fog/arubacloud/models/compute/server'

describe Fog::Compute::ArubaCloud::Server do
  include ModelSetup
  # :service is already took from ModelSetup, no need to redefine it

  let (:server_class) do
    class Fog::Compute::ArubaCloud::Server
      def self.read_identity
        instance_variable_get('@identity')
      end
    end
    Fog::Compute::ArubaCloud::Server
  end

  let(:server) { Fog::Compute::ArubaCloud::Server.new }

  it 'respond to #service' do
    server_class.respond_to? :service
  end

  it 'should have an unique id' do
    server_class.read_identity.must_equal(:id)
  end
end