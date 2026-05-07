#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Bitbucket
            attr_reader :id
            attr_reader :enabled
            attr_reader :key
            attr_reader :secret

            def initialize(
                id:,
                enabled:,
                key:,
                secret:
            )
                @id = id
                @enabled = enabled
                @key = key
                @secret = secret
            end

            def self.from(map:)
                OAuth2Bitbucket.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    key: map["key"],
                    secret: map["secret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "key": @key,
                    "secret": @secret
                }
            end
        end
    end
end
