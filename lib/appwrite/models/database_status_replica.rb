# frozen_string_literal: true

module Appwrite
    module Models
        class DatabaseStatusReplica
            attr_reader :index
            attr_reader :role
            attr_reader :healthy
            attr_reader :replicating
            attr_reader :lag_seconds

            def initialize(
                index:,
                role:,
                healthy:,
                replicating:,
                lag_seconds:
            )
                @index = index
                @role = role
                @healthy = healthy
                @replicating = replicating
                @lag_seconds = lag_seconds
            end

            def self.from(map:)
                DatabaseStatusReplica.new(
                    index: map["index"],
                    role: map["role"],
                    healthy: map["healthy"],
                    replicating: map["replicating"],
                    lag_seconds: map["lagSeconds"]
                )
            end

            def to_map
                {
                    "index": @index,
                    "role": @role,
                    "healthy": @healthy,
                    "replicating": @replicating,
                    "lagSeconds": @lag_seconds
                }
            end
        end
    end
end
