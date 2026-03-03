#frozen_string_literal: true

module Appwrite
    module Models
        class BackupRestoration
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :archive_id
            attr_reader :policy_id
            attr_reader :status
            attr_reader :started_at
            attr_reader :migration_id
            attr_reader :services
            attr_reader :resources
            attr_reader :options

            def initialize(
                id:,
                created_at:,
                updated_at:,
                archive_id:,
                policy_id:,
                status:,
                started_at:,
                migration_id:,
                services:,
                resources:,
                options:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @archive_id = archive_id
                @policy_id = policy_id
                @status = status
                @started_at = started_at
                @migration_id = migration_id
                @services = services
                @resources = resources
                @options = options
            end

            def self.from(map:)
                BackupRestoration.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    archive_id: map["archiveId"],
                    policy_id: map["policyId"],
                    status: map["status"],
                    started_at: map["startedAt"],
                    migration_id: map["migrationId"],
                    services: map["services"],
                    resources: map["resources"],
                    options: map["options"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "archiveId": @archive_id,
                    "policyId": @policy_id,
                    "status": @status,
                    "startedAt": @started_at,
                    "migrationId": @migration_id,
                    "services": @services,
                    "resources": @resources,
                    "options": @options
                }
            end
        end
    end
end
