#
# Author:: Dangleterre Michaël
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'Fog/core/model'
require 'Fog/arubacloud/error'

module Fog
  module Compute
    class ArubaCloud
      class LoadBalancer < Fog::Model
        identity :id, :aliases => 'id'

        attribute :name, :aliases => 'name'
        attribute :rules, :aliases => 'rules'
        attribute :starttime, :aliases => 'starttime'
        attribute :endtime, :aliases => 'endtime'
        attribute :ipaddress, :aliases => 'ipaddress'
        attribute :notificationcontacts, :aliases => 'notificationcontacts'
        attribute :contactid, :aliases => 'contactid'
        attribute :ipaddressesresourceid, :aliases => 'ipaddressesresourceid'
        attribute :healthchecknotification, :aliases => 'healthchecknotification'
        attribute :newrule, :aliases => 'newrule'
        attribute :ruleid, :aliases => 'ruleid'

        ignore_attributes :loadbalancerclassofserviceid

        def initialize(attributes = {})
          @service = attributes[:service]
          super
        end # initialize

        def create_loadbalancer
          requires :name, :rules, :ipaddressesresourceid
          data = attributes
          service.create_loadbalancer(data)
        end # create

        def get_loadbalancer
          requires :id
          response = service.get_loadbalancer(id)
          new_attributes = response['Value']
          merge_attributes(new_attributes)
        end # get

        def modify_loadbalancer
          requires :id, :name, :healthchecknotification
          data = attributes
          service.modify_loadbalancer(data)
        end # edit

        def get_lb_stats
          requires :id, :starttime, :endtime
          data = attributes
          response = service.get_lb_stats(data)
          new_attributes = response['Value']
          merge_attributes(new_attributes)
        end # get stats

        def get_lb_loads
          requires :id, :starttime, :endtime
          data = attributes
          response = service.get_lb_loads(data)
          new_attributes = response['Value']
          merge_attributes(new_attributes)
        end # get loads

        def add_lb_rule
          requires :id, :newrule
          data = attributes
          service.add_lb_rule(data)
        end # add rule

        def remove_instance
          requires :id, :ipaddress
          data = attributes
          service.remove_instance(data)
        end # remove instance

        def add_instance
          requires :id, :ipaddress
          data = attributes
          service.add_instance(data)
        end # add instance

        def get_notifications
          requires :id, :starttime, :endtime, :ruleid
          data = attributes
          response = service.get_notifications(data)
          new_attributes = response['Value']
          merge_attributes(new_attributes)
        end # get notifications

        def add_contact
          requires :id, :notificationcontacts
          data = attributes
          service.add_contact(data)
        end # add contact

        def remove_contact
          requires :id, :contactid
          data = attributes
          service.remove_contact(data)
        end # remove contact

      end # LoadBalancer
    end # ArubaCloud
  end # Compute
end # Fog