#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/core/model'
require 'fog/arubacloud/error'

module Fog
  module Compute
    class ArubaCloud
      class Schedule < Fog::Model
        ADD = 'Add'
        EDIT = 'Edit'
        SUSPEND = 'Suspend'
        DELETE = 'Delete'

        identity :OperationId, :aliases => 'OperationId'

        attribute :operationid, :aliases => 'OperationId'
        attribute :ServerId, :aliases => 'ServerId'
        attribute :OperationType, :aliases => 'OperationType'
        attribute :OperationLabel, :aliases => 'OperationLabel'
        attribute :dateStart, :aliases => 'dateStart'
        attribute :dateEnd, :aliases => 'dateEnd'
        #attribute :OperationParameters, :aliases => 'OperationParameters'
        attribute :frequencyType, :aliases => 'frequencyType'
        attribute :monthlyRecurrence, :aliases => 'monthlyRecurrence'
        attribute :daysOfMonth, :aliases => 'daysOfMonth'
        attribute :daysOfWeek, :aliases => 'daysOfWeek'
        attribute :frequency, :aliases => 'frequency'

        ignore_attributes :OperationParameters

        def initialize
          @service = attributes[:service]
          if attributes[:ServerId].nil? and attributes[:OperationType].nil? and attributes[:dateStart].nil? and attributes[:dateEnd].nil?
            'operation impossible'
          end
        end # initialize

        def get_scheduled_operations
          requires :dateStart, :dateEnd
          response = service.get_scheduled_operations
          new_attributes = response
          merge_attributes(new_attributes)
        end # get_schedule

        def create_scheduled_operation
          requires :ServerId, :OperationType, :OperationLabel, :dateStart, :dateEnd
          data = :attributes
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # create_schedule_operation

        def create_scheduled_occurence
          requires :ServerId, :OperationType, :OperationLabel, :dateStart, :dateEnd, :frequencyType, :monthlyRecurrence, :daysOfMonth, :daysOfWeek, :frequency
          if :name != nil
            data[:name] = name
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end

        def suspend_scheduled_operation
          requires :operationid
          data = :attributes
          if :OperationId != nil
            data[:OperationId] = operationid
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # suspend_scheduled_operation

        def delete_scheduled_operation
          requires :operationid
          data = :attributes
          if :OperationId != nil
            data[:OperationId] = operationid
          else
            raise Fog::ArubaCloud::Errors::BadParameters.Exception('Missing Parameter')
          end
        end # delete_scheduled_operation

      end # Schedule
    end # ArubaCloud
  end # Compute
end # Fog