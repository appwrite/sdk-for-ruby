# frozen_string_literal: true

module Appwrite
    module Models
        class PolicyPasswordRotation
            attr_reader :id
            attr_reader :enabled
            attr_reader :max_age

            def initialize(
                id:,
                enabled:,
                max_age:
            )
                @id = id
                @enabled = enabled
                @max_age = max_age
            end

            def self.from(map:)
                map = { "$id" => "", "enabled" => false, "maxAge" => 31536000 }.merge(map)
                PolicyPasswordRotation.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    max_age: map["maxAge"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "maxAge": @max_age
                }
            end
        end
    end
end
