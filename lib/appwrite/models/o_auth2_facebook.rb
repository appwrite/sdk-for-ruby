#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Facebook
            attr_reader :id
            attr_reader :enabled
            attr_reader :app_id
            attr_reader :app_secret

            def initialize(
                id:,
                enabled:,
                app_id:,
                app_secret:
            )
                @id = id
                @enabled = enabled
                @app_id = app_id
                @app_secret = app_secret
            end

            def self.from(map:)
                OAuth2Facebook.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    app_id: map["appId"],
                    app_secret: map["appSecret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "appId": @app_id,
                    "appSecret": @app_secret
                }
            end
        end
    end
end
