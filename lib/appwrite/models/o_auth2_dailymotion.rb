#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Dailymotion
            attr_reader :id
            attr_reader :enabled
            attr_reader :api_key
            attr_reader :api_secret

            def initialize(
                id:,
                enabled:,
                api_key:,
                api_secret:
            )
                @id = id
                @enabled = enabled
                @api_key = api_key
                @api_secret = api_secret
            end

            def self.from(map:)
                OAuth2Dailymotion.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    api_key: map["apiKey"],
                    api_secret: map["apiSecret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "apiKey": @api_key,
                    "apiSecret": @api_secret
                }
            end
        end
    end
end
