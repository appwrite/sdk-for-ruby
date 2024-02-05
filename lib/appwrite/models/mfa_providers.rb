#frozen_string_literal: true

module Appwrite
    module Models
        class MfaProviders
            attr_reader :totp
            attr_reader :phone
            attr_reader :email

            def initialize(
                totp:,
                phone:,
                email:
            )
                @totp = totp
                @phone = phone
                @email = email
            end

            def self.from(map:)
                MfaProviders.new(
                    totp: map["totp"],
                    phone: map["phone"],
                    email: map["email"]
                )
            end

            def to_map
                {
                    "totp": @totp,
                    "phone": @phone,
                    "email": @email
                }
            end
        end
    end
end