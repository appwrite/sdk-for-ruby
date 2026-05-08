#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Auth0
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :client_secret
            attr_reader :endpoint

            def initialize(
                id:,
                enabled:,
                client_id:,
                client_secret:,
                endpoint:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @client_secret = client_secret
                @endpoint = endpoint
            end

            def self.from(map:)
                OAuth2Auth0.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    client_secret: map["clientSecret"],
                    endpoint: map["endpoint"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "clientSecret": @client_secret,
                    "endpoint": @endpoint
                }
            end
        end
    end
end
