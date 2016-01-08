require 'spec_helper'
require 'fog/arubacloud/models/compute/servers'

describe Fog::Compute::ArubaCloud::Servers do
  # lazy loader (same as let(:subject) { Fog::Compute::ArubaCloud::Servers })
  subject { Fog::Compute::ArubaCloud::Servers }

  it 'should be a collection of Servers' do
    subject.model.must_equal(Fog::Compute::ArubaCloud::Server)
  end
end