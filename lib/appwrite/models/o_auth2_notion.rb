#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Notion
            attr_reader :id
            attr_reader :enabled
            attr_reader :oauth_client_id
            attr_reader :oauth_client_secret

            def initialize(
                id:,
                enabled:,
                oauth_client_id:,
                oauth_client_secret:
            )
                @id = id
                @enabled = enabled
                @oauth_client_id = oauth_client_id
                @oauth_client_secret = oauth_client_secret
            end

            def self.from(map:)
                OAuth2Notion.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    oauth_client_id: map["oauthClientId"],
                    oauth_client_secret: map["oauthClientSecret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "oauthClientId": @oauth_client_id,
                    "oauthClientSecret": @oauth_client_secret
                }
            end
        end
    end
end
