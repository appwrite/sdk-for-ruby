# frozen_string_literal: true

module Appwrite
    module Models
        class MfaFactors
            attr_reader :totp
            attr_reader :phone
            attr_reader :email
            attr_reader :recovery_code
            attr_reader :custom

            def initialize(
                totp:,
                phone:,
                email:,
                recovery_code:,
                custom:
            )
                @totp = totp
                @phone = phone
                @email = email
                @recovery_code = recovery_code
                @custom = custom
            end

            def self.from(map:)
                MfaFactors.new(
                    totp: map["totp"],
                    phone: map["phone"],
                    email: map["email"],
                    recovery_code: map["recoveryCode"],
                    custom: map["custom"]
                )
            end

            def to_map
                {
                    "totp": @totp,
                    "phone": @phone,
                    "email": @email,
                    "recoveryCode": @recovery_code,
                    "custom": @custom
                }
            end
        end
    end
end
