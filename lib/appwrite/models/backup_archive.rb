#frozen_string_literal: true

module Appwrite
    module Models
        class BackupArchive
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :policy_id
            attr_reader :size
            attr_reader :status
            attr_reader :started_at
            attr_reader :migration_id
            attr_reader :services
            attr_reader :resources
            attr_reader :resource_id
            attr_reader :resource_type

            def initialize(
                id:,
                created_at:,
                updated_at:,
                policy_id:,
                size:,
                status:,
                started_at:,
                migration_id:,
                services:,
                resources:,
                resource_id: ,
                resource_type: 
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @policy_id = policy_id
                @size = size
                @status = status
                @started_at = started_at
                @migration_id = migration_id
                @services = services
                @resources = resources
                @resource_id = resource_id
                @resource_type = resource_type
            end

            def self.from(map:)
                BackupArchive.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    policy_id: map["policyId"],
                    size: map["size"],
                    status: map["status"],
                    started_at: map["startedAt"],
                    migration_id: map["migrationId"],
                    services: map["services"],
                    resources: map["resources"],
                    resource_id: map["resourceId"],
                    resource_type: map["resourceType"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "policyId": @policy_id,
                    "size": @size,
                    "status": @status,
                    "startedAt": @started_at,
                    "migrationId": @migration_id,
                    "services": @services,
                    "resources": @resources,
                    "resourceId": @resource_id,
                    "resourceType": @resource_type
                }
            end
        end
    end
end
