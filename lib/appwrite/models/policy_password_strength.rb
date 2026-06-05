#frozen_string_literal: true

module Appwrite
    module Models
        class PolicyPasswordStrength
            attr_reader :id
            attr_reader :min
            attr_reader :uppercase
            attr_reader :lowercase
            attr_reader :number
            attr_reader :symbols

            def initialize(
                id:,
                min:,
                uppercase:,
                lowercase:,
                number:,
                symbols:
            )
                @id = id
                @min = min
                @uppercase = uppercase
                @lowercase = lowercase
                @number = number
                @symbols = symbols
            end

            def self.from(map:)
                PolicyPasswordStrength.new(
                    id: map["$id"],
                    min: map["min"],
                    uppercase: map["uppercase"],
                    lowercase: map["lowercase"],
                    number: map["number"],
                    symbols: map["symbols"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "min": @min,
                    "uppercase": @uppercase,
                    "lowercase": @lowercase,
                    "number": @number,
                    "symbols": @symbols
                }
            end
        end
    end
end
