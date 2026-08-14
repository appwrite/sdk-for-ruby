#frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseOperation
            attr_reader :id
            attr_reader :created_at
            attr_reader :database_id
            attr_reader :type
            attr_reader :status
            attr_reader :attempts
            attr_reader :requested_at
            attr_reader :started_at
            attr_reader :completed_at
            attr_reader :error_code
            attr_reader :error_message

            def initialize(
                id:,
                created_at:,
                database_id:,
                type:,
                status:,
                attempts:,
                requested_at: ,
                started_at: ,
                completed_at: ,
                error_code:,
                error_message:
            )
                @id = id
                @created_at = created_at
                @database_id = database_id
                @type = type
                @status = status
                @attempts = attempts
                @requested_at = requested_at
                @started_at = started_at
                @completed_at = completed_at
                @error_code = error_code
                @error_message = error_message
            end

            def self.from(map:)
                DedicatedDatabaseOperation.new(
                    id: map["$id"],
                    created_at: map["$createdAt"],
                    database_id: map["databaseId"],
                    type: map["type"],
                    status: map["status"],
                    attempts: map["attempts"],
                    requested_at: map["requestedAt"],
                    started_at: map["startedAt"],
                    completed_at: map["completedAt"],
                    error_code: map["errorCode"],
                    error_message: map["errorMessage"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "$createdAt": @created_at,
                    "databaseId": @database_id,
                    "type": @type,
                    "status": @status,
                    "attempts": @attempts,
                    "requestedAt": @requested_at,
                    "startedAt": @started_at,
                    "completedAt": @completed_at,
                    "errorCode": @error_code,
                    "errorMessage": @error_message
                }
            end
        end
    end
end
