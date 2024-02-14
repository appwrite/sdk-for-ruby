#frozen_string_literal: true

module Appwrite
    module Models
        class Headers
            attr_reader :name
            attr_reader :value

            def initialize(
                name:,
                value:
            )
                @name = name
                @value = value
            end

            def self.from(map:)
                Headers.new(
                    name: map["name"],
                    value: map["value"]
                )
            end

            def to_map
                {
                    "name": @name,
                    "value": @value
                }
            end
        end
    end
end
