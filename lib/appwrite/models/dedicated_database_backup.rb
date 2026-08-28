# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseBackup
            attr_reader :id
            attr_reader :created_at
            attr_reader :database_id
            attr_reader :project_id
            attr_reader :policy_id
            attr_reader :trigger
            attr_reader :type
            attr_reader :requested_type
            attr_reader :fallback_reason
            attr_reader :status
            attr_reader :size_bytes
            attr_reader :started_at
            attr_reader :completed_at
            attr_reader :verified_at
            attr_reader :expires_at
            attr_reader :log_position
            attr_reader :error

            def initialize(
                id:,
                created_at:,
                database_id:,
                project_id:,
                policy_id:,
                trigger:,
                type:,
                requested_type:,
                fallback_reason:,
                status:,
                size_bytes:,
                started_at:,
                completed_at:,
                verified_at:,
                expires_at:,
                log_position:,
                error:
            )
                @id = id
                @created_at = created_at
                @database_id = database_id
                @project_id = project_id
                @policy_id = policy_id
                @trigger = trigger
                @type = type
                @requested_type = requested_type
                @fallback_reason = fallback_reason
                @status = status
                @size_bytes = size_bytes
                @started_at = started_at
                @completed_at = completed_at
                @verified_at = verified_at
                @expires_at = expires_at
                @log_position = log_position
                @error = error
            end

            def self.from(map:)
                DedicatedDatabaseBackup.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    database_id: map["databaseId"],
                    project_id: map["projectId"],
                    policy_id: map["policyId"],
                    trigger: map["trigger"],
                    type: map["type"],
                    requested_type: map["requestedType"],
                    fallback_reason: map["fallbackReason"],
                    status: map["status"],
                    size_bytes: map["sizeBytes"],
                    started_at: map["startedAt"],
                    completed_at: map["completedAt"],
                    verified_at: map["verifiedAt"],
                    expires_at: map["expiresAt"],
                    log_position: map["logPosition"],
                    error: map["error"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "databaseId": @database_id,
                    "projectId": @project_id,
                    "policyId": @policy_id,
                    "trigger": @trigger,
                    "type": @type,
                    "requestedType": @requested_type,
                    "fallbackReason": @fallback_reason,
                    "status": @status,
                    "sizeBytes": @size_bytes,
                    "startedAt": @started_at,
                    "completedAt": @completed_at,
                    "verifiedAt": @verified_at,
                    "expiresAt": @expires_at,
                    "logPosition": @log_position,
                    "error": @error
                }
            end
        end
    end
end
