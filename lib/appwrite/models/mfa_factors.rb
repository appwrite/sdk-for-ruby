#frozen_string_literal: true

module Appwrite
    module Models
        class MfaFactors
            attr_reader :totp
            attr_reader :phone
            attr_reader :email
            attr_reader :recovery_code

            def initialize(
                totp:,
                phone:,
                email:,
                recovery_code:
            )
                @totp = totp
                @phone = phone
                @email = email
                @recovery_code = recovery_code
            end

            def self.from(map:)
                MfaFactors.new(
                    totp: map["totp"],
                    phone: map["phone"],
                    email: map["email"],
                    recovery_code: map["recoveryCode"]
                )
            end

            def to_map
                {
                    "totp": @totp,
                    "phone": @phone,
                    "email": @email,
                    "recoveryCode": @recovery_code
                }
            end
        end
    end
end
