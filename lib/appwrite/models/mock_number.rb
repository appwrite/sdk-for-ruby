#frozen_string_literal: true

module Appwrite
    module Models
        class MockNumber
            attr_reader :phone
            attr_reader :otp

            def initialize(
                phone:,
                otp:
            )
                @phone = phone
                @otp = otp
            end

            def self.from(map:)
                MockNumber.new(
                    phone: map["phone"],
                    otp: map["otp"]
                )
            end

            def to_map
                {
                    "phone": @phone,
                    "otp": @otp
                }
            end
        end
    end
end
