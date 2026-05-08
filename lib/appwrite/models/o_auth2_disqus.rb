#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Disqus
            attr_reader :id
            attr_reader :enabled
            attr_reader :public_key
            attr_reader :secret_key

            def initialize(
                id:,
                enabled:,
                public_key:,
                secret_key:
            )
                @id = id
                @enabled = enabled
                @public_key = public_key
                @secret_key = secret_key
            end

            def self.from(map:)
                OAuth2Disqus.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    public_key: map["publicKey"],
                    secret_key: map["secretKey"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "publicKey": @public_key,
                    "secretKey": @secret_key
                }
            end
        end
    end
end
