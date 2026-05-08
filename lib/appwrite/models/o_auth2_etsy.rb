#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Etsy
            attr_reader :id
            attr_reader :enabled
            attr_reader :key_string
            attr_reader :shared_secret

            def initialize(
                id:,
                enabled:,
                key_string:,
                shared_secret:
            )
                @id = id
                @enabled = enabled
                @key_string = key_string
                @shared_secret = shared_secret
            end

            def self.from(map:)
                OAuth2Etsy.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    key_string: map["keyString"],
                    shared_secret: map["sharedSecret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "keyString": @key_string,
                    "sharedSecret": @shared_secret
                }
            end
        end
    end
end
