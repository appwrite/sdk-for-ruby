#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Oidc
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :client_secret
            attr_reader :well_known_url
            attr_reader :authorization_url
            attr_reader :token_url
            attr_reader :user_info_url

            def initialize(
                id:,
                enabled:,
                client_id:,
                client_secret:,
                well_known_url:,
                authorization_url:,
                token_url:,
                user_info_url:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @client_secret = client_secret
                @well_known_url = well_known_url
                @authorization_url = authorization_url
                @token_url = token_url
                @user_info_url = user_info_url
            end

            def self.from(map:)
                OAuth2Oidc.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    client_secret: map["clientSecret"],
                    well_known_url: map["wellKnownURL"],
                    authorization_url: map["authorizationURL"],
                    token_url: map["tokenURL"],
                    user_info_url: map["userInfoURL"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "clientSecret": @client_secret,
                    "wellKnownURL": @well_known_url,
                    "authorizationURL": @authorization_url,
                    "tokenURL": @token_url,
                    "userInfoURL": @user_info_url
                }
            end
        end
    end
end
