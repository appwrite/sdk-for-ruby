#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Gitlab
            attr_reader :id
            attr_reader :enabled
            attr_reader :application_id
            attr_reader :secret
            attr_reader :endpoint

            def initialize(
                id:,
                enabled:,
                application_id:,
                secret:,
                endpoint:
            )
                @id = id
                @enabled = enabled
                @application_id = application_id
                @secret = secret
                @endpoint = endpoint
            end

            def self.from(map:)
                OAuth2Gitlab.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    application_id: map["applicationId"],
                    secret: map["secret"],
                    endpoint: map["endpoint"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "applicationId": @application_id,
                    "secret": @secret,
                    "endpoint": @endpoint
                }
            end
        end
    end
end
