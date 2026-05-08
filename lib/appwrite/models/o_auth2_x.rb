#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2X
            attr_reader :id
            attr_reader :enabled
            attr_reader :customer_key
            attr_reader :secret_key

            def initialize(
                id:,
                enabled:,
                customer_key:,
                secret_key:
            )
                @id = id
                @enabled = enabled
                @customer_key = customer_key
                @secret_key = secret_key
            end

            def self.from(map:)
                OAuth2X.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    customer_key: map["customerKey"],
                    secret_key: map["secretKey"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "customerKey": @customer_key,
                    "secretKey": @secret_key
                }
            end
        end
    end
end
