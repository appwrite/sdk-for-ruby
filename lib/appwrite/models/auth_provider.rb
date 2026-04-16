#frozen_string_literal: true

module Appwrite
    module Models
        class AuthProvider
            attr_reader :key
            attr_reader :name
            attr_reader :app_id
            attr_reader :secret
            attr_reader :enabled

            def initialize(
                key:,
                name:,
                app_id:,
                secret:,
                enabled:
            )
                @key = key
                @name = name
                @app_id = app_id
                @secret = secret
                @enabled = enabled
            end

            def self.from(map:)
                AuthProvider.new(
                    key: map["key"],
                    name: map["name"],
                    app_id: map["appId"],
                    secret: map["secret"],
                    enabled: map["enabled"]
                )
            end

            def to_map
                {
                    "key": @key,
                    "name": @name,
                    "appId": @app_id,
                    "secret": @secret,
                    "enabled": @enabled
                }
            end
        end
    end
end
