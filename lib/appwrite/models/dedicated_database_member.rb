#frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseMember
            attr_reader :id
            attr_reader :role
            attr_reader :status
            attr_reader :lag_seconds

            def initialize(
                id:,
                role:,
                status:,
                lag_seconds: 
            )
                @id = id
                @role = role
                @status = status
                @lag_seconds = lag_seconds
            end

            def self.from(map:)
                DedicatedDatabaseMember.new(
                    id: map["$id"],
                    role: map["role"],
                    status: map["status"],
                    lag_seconds: map["lagSeconds"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "role": @role,
                    "status": @status,
                    "lagSeconds": @lag_seconds
                }
            end
        end
    end
end
