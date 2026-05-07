#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Stripe
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :api_secret_key

            def initialize(
                id:,
                enabled:,
                client_id:,
                api_secret_key:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @api_secret_key = api_secret_key
            end

            def self.from(map:)
                OAuth2Stripe.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    api_secret_key: map["apiSecretKey"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "apiSecretKey": @api_secret_key
                }
            end
        end
    end
end
