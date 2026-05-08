#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Microsoft
            attr_reader :id
            attr_reader :enabled
            attr_reader :application_id
            attr_reader :application_secret
            attr_reader :tenant

            def initialize(
                id:,
                enabled:,
                application_id:,
                application_secret:,
                tenant:
            )
                @id = id
                @enabled = enabled
                @application_id = application_id
                @application_secret = application_secret
                @tenant = tenant
            end

            def self.from(map:)
                OAuth2Microsoft.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    application_id: map["applicationId"],
                    application_secret: map["applicationSecret"],
                    tenant: map["tenant"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "applicationId": @application_id,
                    "applicationSecret": @application_secret,
                    "tenant": @tenant
                }
            end
        end
    end
end
