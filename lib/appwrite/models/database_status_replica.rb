#frozen_string_literal: true

module Appwrite
    module Models
        class DatabaseStatusReplica
            attr_reader :index
            attr_reader :role
            attr_reader :healthy
            attr_reader :lag_seconds

            def initialize(
                index:,
                role:,
                healthy:,
                lag_seconds: 
            )
                @index = index
                @role = role
                @healthy = healthy
                @lag_seconds = lag_seconds
            end

            def self.from(map:)
                DatabaseStatusReplica.new(
                    index: map["index"],
                    role: map["role"],
                    healthy: map["healthy"],
                    lag_seconds: map["lagSeconds"]
                )
            end

            def to_map
                {
                    "index": @index,
                    "role": @role,
                    "healthy": @healthy,
                    "lagSeconds": @lag_seconds
                }
            end
        end
    end
end
