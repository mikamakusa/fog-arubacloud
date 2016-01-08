module ModelSetup
  def self.included(base)
    base.class_eval do
      let(:arguments) do
        {
            :arubacloud_username => '',
            :arubacloud_password => '',
            :url => ''
        }
      end

      # Initialize the service object to be used inside models tests
      let(:service) { Fog::Compute::ArubaCloud.new(arguments) }
    end
  end
end