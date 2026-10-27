# frozen_string_literal: true

module Appwrite
    module Models
        class Migration
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :status
            attr_reader :stage
            attr_reader :source
            attr_reader :destination
            attr_reader :resources
            attr_reader :resource_id
            attr_reader :resource_internal_id
            attr_reader :resource_type
            attr_reader :parent_resource_id
            attr_reader :parent_resource_internal_id
            attr_reader :parent_resource_type
            attr_reader :destination_resource_id
            attr_reader :destination_resource_internal_id
            attr_reader :destination_resource_type
            attr_reader :status_counters
            attr_reader :resource_data
            attr_reader :errors
            attr_reader :options

            def initialize(
                id:,
                created_at:,
                updated_at:,
                status:,
                stage:,
                source:,
                destination:,
                resources:,
                resource_id:,
                resource_internal_id:,
                resource_type:,
                parent_resource_id:,
                parent_resource_internal_id:,
                parent_resource_type:,
                destination_resource_id:,
                destination_resource_internal_id:,
                destination_resource_type:,
                status_counters:,
                resource_data:,
                errors:,
                options:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @status = status
                @stage = stage
                @source = source
                @destination = destination
                @resources = resources
                @resource_id = resource_id
                @resource_internal_id = resource_internal_id
                @resource_type = resource_type
                @parent_resource_id = parent_resource_id
                @parent_resource_internal_id = parent_resource_internal_id
                @parent_resource_type = parent_resource_type
                @destination_resource_id = destination_resource_id
                @destination_resource_internal_id = destination_resource_internal_id
                @destination_resource_type = destination_resource_type
                @status_counters = status_counters
                @resource_data = resource_data
                @errors = errors
                @options = options
            end

            def self.from(map:)
                map = { "$id" => "", "$createdAt" => "", "$updatedAt" => "", "status" => "", "stage" => "", "source" => "", "destination" => "Appwrite", "resources" => [], "resourceId" => "", "resourceInternalId" => "", "resourceType" => "", "parentResourceId" => "", "parentResourceInternalId" => "", "parentResourceType" => "", "destinationResourceId" => "", "destinationResourceInternalId" => "", "destinationResourceType" => "", "statusCounters" => {}, "resourceData" => [], "errors" => [], "options" => {} }.merge(map)
                Migration.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    status: map["status"],
                    stage: map["stage"],
                    source: map["source"],
                    destination: map["destination"],
                    resources: map["resources"],
                    resource_id: map["resourceId"],
                    resource_internal_id: map["resourceInternalId"],
                    resource_type: map["resourceType"],
                    parent_resource_id: map["parentResourceId"],
                    parent_resource_internal_id: map["parentResourceInternalId"],
                    parent_resource_type: map["parentResourceType"],
                    destination_resource_id: map["destinationResourceId"],
                    destination_resource_internal_id: map["destinationResourceInternalId"],
                    destination_resource_type: map["destinationResourceType"],
                    status_counters: map["statusCounters"],
                    resource_data: map["resourceData"],
                    errors: map["errors"],
                    options: map["options"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "status": @status,
                    "stage": @stage,
                    "source": @source,
                    "destination": @destination,
                    "resources": @resources,
                    "resourceId": @resource_id,
                    "resourceInternalId": @resource_internal_id,
                    "resourceType": @resource_type,
                    "parentResourceId": @parent_resource_id,
                    "parentResourceInternalId": @parent_resource_internal_id,
                    "parentResourceType": @parent_resource_type,
                    "destinationResourceId": @destination_resource_id,
                    "destinationResourceInternalId": @destination_resource_internal_id,
                    "destinationResourceType": @destination_resource_type,
                    "statusCounters": @status_counters,
                    "resourceData": @resource_data,
                    "errors": @errors,
                    "options": @options
                }
            end
        end
    end
end
