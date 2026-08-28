# frozen_string_literal: true

module Appwrite
    module Models
        class PolicyMfaFactors
            attr_reader :id
            attr_reader :totp
            attr_reader :email
            attr_reader :phone
            attr_reader :custom

            def initialize(
                id:,
                totp:,
                email:,
                phone:,
                custom:
            )
                @id = id
                @totp = totp
                @email = email
                @phone = phone
                @custom = custom
            end

            def self.from(map:)
                PolicyMfaFactors.new(
                    id: map["$id"],
                    totp: map["totp"],
                    email: map["email"],
                    phone: map["phone"],
                    custom: map["custom"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "totp": @totp,
                    "email": @email,
                    "phone": @phone,
                    "custom": @custom
                }
            end
        end
    end
end
