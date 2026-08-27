# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseRestoration
            attr_reader :id
            attr_reader :created_at
            attr_reader :database_id
            attr_reader :source_database_id
            attr_reader :project_id
            attr_reader :backup_id
            attr_reader :type
            attr_reader :status
            attr_reader :target_time
            attr_reader :started_at
            attr_reader :completed_at
            attr_reader :error

            def initialize(
                id:,
                created_at:,
                database_id:,
                source_database_id:,
                project_id:,
                backup_id:,
                type:,
                status:,
                target_time:,
                started_at:,
                completed_at:,
                error:
            )
                @id = id
                @created_at = created_at
                @database_id = database_id
                @source_database_id = source_database_id
                @project_id = project_id
                @backup_id = backup_id
                @type = type
                @status = status
                @target_time = target_time
                @started_at = started_at
                @completed_at = completed_at
                @error = error
            end

            def self.from(map:)
                DedicatedDatabaseRestoration.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    database_id: map["databaseId"],
                    source_database_id: map["sourceDatabaseId"],
                    project_id: map["projectId"],
                    backup_id: map["backupId"],
                    type: map["type"],
                    status: map["status"],
                    target_time: map["targetTime"],
                    started_at: map["startedAt"],
                    completed_at: map["completedAt"],
                    error: map["error"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "databaseId": @database_id,
                    "sourceDatabaseId": @source_database_id,
                    "projectId": @project_id,
                    "backupId": @backup_id,
                    "type": @type,
                    "status": @status,
                    "targetTime": @target_time,
                    "startedAt": @started_at,
                    "completedAt": @completed_at,
                    "error": @error
                }
            end
        end
    end
end
