#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Salesforce
            attr_reader :id
            attr_reader :enabled
            attr_reader :customer_key
            attr_reader :customer_secret

            def initialize(
                id:,
                enabled:,
                customer_key:,
                customer_secret:
            )
                @id = id
                @enabled = enabled
                @customer_key = customer_key
                @customer_secret = customer_secret
            end

            def self.from(map:)
                OAuth2Salesforce.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    customer_key: map["customerKey"],
                    customer_secret: map["customerSecret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "customerKey": @customer_key,
                    "customerSecret": @customer_secret
                }
            end
        end
    end
end
