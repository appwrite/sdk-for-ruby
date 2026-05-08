#frozen_string_literal: true

module Appwrite
    module Models
        class MockNumber
            attr_reader :number
            attr_reader :otp
            attr_reader :created_at
            attr_reader :updated_at

            def initialize(
                number:,
                otp:,
                created_at:,
                updated_at:
            )
                @number = number
                @otp = otp
                @created_at = created_at
                @updated_at = updated_at
            end

            def self.from(map:)
                MockNumber.new(
                    number: map["number"],
                    otp: map["otp"],
                    created_at: map["$createdAt"],
                    updated_at: map["$updatedAt"]
                )
            end

            def to_map
                {
                    "number": @number,
                    "otp": @otp,
                    "$createdAt": @created_at,
                    "$updatedAt": @updated_at
                }
            end
        end
    end
end
