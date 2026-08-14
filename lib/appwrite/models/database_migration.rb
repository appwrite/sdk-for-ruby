#frozen_string_literal: true

module Appwrite
    module Models
        class DatabaseMigration
            attr_reader :id
            attr_reader :created_at
            attr_reader :updated_at
            attr_reader :project_id
            attr_reader :database_id
            attr_reader :specification
            attr_reader :phase
            attr_reader :attempt
            attr_reader :last_error
            attr_reader :lag_documents
            attr_reader :verified_at
            attr_reader :cutover_at
            attr_reader :soak_until
            attr_reader :auto_cutover
            attr_reader :cutover_requested
            attr_reader :paused

            def initialize(
                id:,
                created_at:,
                updated_at:,
                project_id:,
                database_id:,
                specification:,
                phase:,
                attempt:,
                last_error:,
                lag_documents:,
                verified_at:,
                cutover_at:,
                soak_until:,
                auto_cutover:,
                cutover_requested:,
                paused:
            )
                @id = id
                @created_at = created_at
                @updated_at = updated_at
                @project_id = project_id
                @database_id = database_id
                @specification = specification
                @phase = phase
                @attempt = attempt
                @last_error = last_error
                @lag_documents = lag_documents
                @verified_at = verified_at
                @cutover_at = cutover_at
                @soak_until = soak_until
                @auto_cutover = auto_cutover
                @cutover_requested = cutover_requested
                @paused = paused
            end

            def self.from(map:)
                DatabaseMigration.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"],
                    project_id: map["projectId"],
                    database_id: map["databaseId"],
                    specification: map["specification"],
                    phase: map["phase"],
                    attempt: map["attempt"],
                    last_error: map["lastError"],
                    lag_documents: map["lagDocuments"],
                    verified_at: map["verifiedAt"],
                    cutover_at: map["cutoverAt"],
                    soak_until: map["soakUntil"],
                    auto_cutover: map["autoCutover"],
                    cutover_requested: map["cutoverRequested"],
                    paused: map["paused"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at,
                    "projectId": @project_id,
                    "databaseId": @database_id,
                    "specification": @specification,
                    "phase": @phase,
                    "attempt": @attempt,
                    "lastError": @last_error,
                    "lagDocuments": @lag_documents,
                    "verifiedAt": @verified_at,
                    "cutoverAt": @cutover_at,
                    "soakUntil": @soak_until,
                    "autoCutover": @auto_cutover,
                    "cutoverRequested": @cutover_requested,
                    "paused": @paused
                }
            end
        end
    end
end
