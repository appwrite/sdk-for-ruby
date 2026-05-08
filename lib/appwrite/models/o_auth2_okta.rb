#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Okta
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :client_secret
            attr_reader :domain
            attr_reader :authorization_server_id

            def initialize(
                id:,
                enabled:,
                client_id:,
                client_secret:,
                domain:,
                authorization_server_id:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @client_secret = client_secret
                @domain = domain
                @authorization_server_id = authorization_server_id
            end

            def self.from(map:)
                OAuth2Okta.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    client_secret: map["clientSecret"],
                    domain: map["domain"],
                    authorization_server_id: map["authorizationServerId"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "clientSecret": @client_secret,
                    "domain": @domain,
                    "authorizationServerId": @authorization_server_id
                }
            end
        end
    end
end
