# frozen_string_literal: true

module Appwrite
    module Models
        class DatabaseStatusConnections
            attr_reader :current
            attr_reader :max

            def initialize(
                current:,
                max:
            )
                @current = current
                @max = max
            end

            def self.from(map:)
                DatabaseStatusConnections.new(
                    current: map["current"],
                    max: map["max"]
                )
            end

            def to_map
                {
                    "current": @current,
                    "max": @max
                }
            end
        end
    end
end
