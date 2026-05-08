#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Linkedin
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :primary_client_secret

            def initialize(
                id:,
                enabled:,
                client_id:,
                primary_client_secret:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @primary_client_secret = primary_client_secret
            end

            def self.from(map:)
                OAuth2Linkedin.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    primary_client_secret: map["primaryClientSecret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "primaryClientSecret": @primary_client_secret
                }
            end
        end
    end
end
