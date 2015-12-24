#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/model'

module Fog
  module Compute
    class ArubaCloud

      class Template < Fog::Model
        identity :id, :aliases => 'Id'

        attribute :name, :aliases => 'Name'
        attribute :description, :aliases => 'Description'
        attribute :enabled, :aliases => 'Enabled'
        attribute :export_enabled, :aliases => 'ExportEnabled'
        attribute :identification_code, :aliases => 'IdentificationCode'
        attribute :product_id, :aliases => 'ProductId'
        attribute :hypervisor

        ignore_attributes :ApplianceType, :ArchitectureType, :CompanyID, :CompatiblePreConfiguredPackages,
            :FeatureTypes, :Icon, :OwnerUserId, :ParentTemplateID, :OSFamily, :OSVersion, :ResourceBounds,
            :Revision, :TemplateExtendedDescription, :TemplateOwnershipType, :TemplatePassword,
            :TemplateSellingStatus, :TemplateType, :TemplateUsername, :ToolsAvailable
      end

    end
  end
end