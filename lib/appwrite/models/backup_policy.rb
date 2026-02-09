#frozen_string_literal: true

module Appwrite
    module Models
        class BackupPolicy
            attr_reader :id
            attr_reader :name
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :services
            attr_reader :resources
            attr_reader :resource_id
            attr_reader :resource_type
            attr_reader :retention
            attr_reader :schedule
            attr_reader :enabled

            def initialize(
                id:,
                name:,
                created_at:,
                updated_at:,
                services:,
                resources:,
                resource_id: ,
                resource_type: ,
                retention:,
                schedule:,
                enabled:
            )
                @id = id
                @name = name
                @created_at = created_at
                @updated_at = updated_at
                @services = services
                @resources = resources
                @resource_id = resource_id
                @resource_type = resource_type
                @retention = retention
                @schedule = schedule
                @enabled = enabled
            end

            def self.from(map:)
                BackupPolicy.new(
                    id: map["$id"],
                    name: map["name"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    services: map["services"],
                    resources: map["resources"],
                    resource_id: map["resourceId"],
                    resource_type: map["resourceType"],
                    retention: map["retention"],
                    schedule: map["schedule"],
                    enabled: map["enabled"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "name": @name,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "services": @services,
                    "resources": @resources,
                    "resourceId": @resource_id,
                    "resourceType": @resource_type,
                    "retention": @retention,
                    "schedule": @schedule,
                    "enabled": @enabled
                }
            end
        end
    end
end
