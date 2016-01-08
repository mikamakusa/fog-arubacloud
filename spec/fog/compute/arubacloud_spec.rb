require 'spec_helper'

describe Fog::Compute::ArubaCloud do
  describe 'it create the provider object' do

    before do
      @arguments = {
          :arubacloud_username => '',
          :arubacloud_password => '',
          :url 								 => ''
      }
      @service = Fog::Compute::ArubaCloud.new(@arguments)
    end

    it 'respond to #request' do
      assert_respond_to @service, :request
    end

    it 'is defined @arubacloud_username' do
      assert @service.instance_variable_defined?(:@arubacloud_username)
    end

    it 'is defined @arubacloud_password' do
      assert @service.instance_variable_defined?(:@arubacloud_password)
    end

    it 'respond to #servers' do
      assert @service.respond_to? :servers
    end

  end
end
