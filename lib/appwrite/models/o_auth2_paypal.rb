#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Paypal
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :secret_key

            def initialize(
                id:,
                enabled:,
                client_id:,
                secret_key:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @secret_key = secret_key
            end

            def self.from(map:)
                OAuth2Paypal.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    secret_key: map["secretKey"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "secretKey": @secret_key
                }
            end
        end
    end
end
