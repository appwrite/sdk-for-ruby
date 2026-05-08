#frozen_string_literal: true

module Appwrite
    module Models
        class PolicySessionInvalidation
            attr_reader :id
            attr_reader :enabled

            def initialize(
                id:,
                enabled:
            )
                @id = id
                @enabled = enabled
            end

            def self.from(map:)
                PolicySessionInvalidation.new(
                    id: map["$id"],
                    enabled: map["enabled"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled
                }
            end
        end
    end
end
