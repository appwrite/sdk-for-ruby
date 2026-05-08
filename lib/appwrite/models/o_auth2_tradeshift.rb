#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Tradeshift
            attr_reader :id
            attr_reader :enabled
            attr_reader :oauth2_client_id
            attr_reader :oauth2_client_secret

            def initialize(
                id:,
                enabled:,
                oauth2_client_id:,
                oauth2_client_secret:
            )
                @id = id
                @enabled = enabled
                @oauth2_client_id = oauth2_client_id
                @oauth2_client_secret = oauth2_client_secret
            end

            def self.from(map:)
                OAuth2Tradeshift.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    oauth2_client_id: map["oauth2ClientId"],
                    oauth2_client_secret: map["oauth2ClientSecret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "oauth2ClientId": @oauth2_client_id,
                    "oauth2ClientSecret": @oauth2_client_secret
                }
            end
        end
    end
end
