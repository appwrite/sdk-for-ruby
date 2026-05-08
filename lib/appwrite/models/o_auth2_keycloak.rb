#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Keycloak
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :client_secret
            attr_reader :endpoint
            attr_reader :realm_name

            def initialize(
                id:,
                enabled:,
                client_id:,
                client_secret:,
                endpoint:,
                realm_name:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @client_secret = client_secret
                @endpoint = endpoint
                @realm_name = realm_name
            end

            def self.from(map:)
                OAuth2Keycloak.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    client_secret: map["clientSecret"],
                    endpoint: map["endpoint"],
                    realm_name: map["realmName"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "clientSecret": @client_secret,
                    "endpoint": @endpoint,
                    "realmName": @realm_name
                }
            end
        end
    end
end
