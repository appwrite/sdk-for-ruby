#frozen_string_literal: true

module Appwrite
    module Models
        class OAuth2Apple
            attr_reader :id
            attr_reader :enabled
            attr_reader :service_id
            attr_reader :key_id
            attr_reader :team_id
            attr_reader :p8_file

            def initialize(
                id:,
                enabled:,
                service_id:,
                key_id:,
                team_id:,
                p8_file:
            )
                @id = id
                @enabled = enabled
                @service_id = service_id
                @key_id = key_id
                @team_id = team_id
                @p8_file = p8_file
            end

            def self.from(map:)
                OAuth2Apple.new(
                    id: map["$id"],
                    enabled: map["enabled"],
                    service_id: map["serviceId"],
                    key_id: map["keyId"],
                    team_id: map["teamId"],
                    p8_file: map["p8File"]
                )
            end

            def to_map
                {
                    "$id": @id,
                    "enabled": @enabled,
                    "serviceId": @service_id,
                    "keyId": @key_id,
                    "teamId": @team_id,
                    "p8File": @p8_file
                }
            end
        end
    end
end
