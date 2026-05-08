#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Dropbox
            attr_reader :id
            attr_reader :enabled
            attr_reader :app_key
            attr_reader :app_secret

            def initialize(
                id:,
                enabled:,
                app_key:,
                app_secret:
            )
                @id = id
                @enabled = enabled
                @app_key = app_key
                @app_secret = app_secret
            end

            def self.from(map:)
                OAuth2Dropbox.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    app_key: map["appKey"],
                    app_secret: map["appSecret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "appKey": @app_key,
                    "appSecret": @app_secret
                }
            end
        end
    end
end
