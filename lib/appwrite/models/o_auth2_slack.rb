#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Slack
            attr_reader :id
            attr_reader :enabled
            attr_reader :client_id
            attr_reader :client_secret

            def initialize(
                id:,
                enabled:,
                client_id:,
                client_secret:
            )
                @id = id
                @enabled = enabled
                @client_id = client_id
                @client_secret = client_secret
            end

            def self.from(map:)
                OAuth2Slack.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    client_id: map["clientId"],
                    client_secret: map["clientSecret"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "clientId": @client_id,
                    "clientSecret": @client_secret
                }
            end
        end
    end
end
