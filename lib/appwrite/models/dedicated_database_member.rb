# frozen_string_literal: true

module Appwrite
    module Models
        class DedicatedDatabaseMember
            attr_reader :id
            attr_reader :role
            attr_reader :status
            attr_reader :replicating
            attr_reader :lag_seconds

            def initialize(
                id:,
                role:,
                status:,
                replicating:,
                lag_seconds:
            )
                @id = id
                @role = role
                @status = status
                @replicating = replicating
                @lag_seconds = lag_seconds
            end

            def self.from(map:)
                DedicatedDatabaseMember.new(
                    id: map["$id"],
                    role: map["role"],
                    status: map["status"],
                    replicating: map["replicating"],
                    lag_seconds: map["lagSeconds"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "role": @role,
                    "status": @status,
                    "replicating": @replicating,
                    "lagSeconds": @lag_seconds
                }
            end
        end
    end
end
